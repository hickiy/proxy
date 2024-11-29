# 使用多阶段构建
# 第一阶段：构建nginx镜像
FROM nginx:latest as nginx

# 复制nginx配置文件到容器中
COPY src/default.conf /etc/nginx/conf.d/default.conf

# 第二阶段：构建shadowsocks_python服务端
FROM python:3.9-slim

# 安装shadowsocks
RUN pip install shadowsocks

# 复制nginx配置文件
COPY --from=nginx /etc/nginx /etc/nginx

# 复制shadowsocks配置文件
COPY config.json /etc/shadowsocks/config.json

# 复制启动脚本
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 暴露端口
EXPOSE 80 443 8388

# 启动脚本
CMD ["/start.sh"]