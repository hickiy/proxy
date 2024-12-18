# 声明基础镜像 debian:bullseye-slim
FROM debian:bullseye-slim

# 更新apt-get源
RUN apt-get update

# 安装nginx
RUN apt-get install -y nginx

# 安装certbot
RUN apt-get install -y certbot python3-certbot-nginx

# 安装shadowsocks
RUN apt-get install -y shadowsocks-libev

# 复制配置文件
COPY ./src/default.conf /etc/nginx/sites-available/default.conf

# 复制启动脚本
COPY ./src/start.sh /start.sh

# 设置启动脚本权限
RUN chmod +x /start.sh

# 暴露端口
EXPOSE 80 443 8095

# 启动命令
CMD ["/start.sh"]
