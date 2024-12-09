# 安装nginx
FROM nginx:latest

# 更新源
RUN apt-get update

# 安装certbot
RUN apt-get install -y certbot

# 安装python运行环境
RUN apt-get install -y python3 python3-pip

# 安装shadowsocks
RUN pip install shadowsocks

# 复制nginx配置文件到容器中
COPY src/default.conf /etc/nginx/conf.d/default.conf

# 复制shadowsocks配置文件
COPY src/config.json /etc/shadowsocks/config.json

# 复制启动脚本
COPY src/start.sh /start.sh
COPY src/nginx.sh /nginx.sh
COPY src/ssserver.sh /ssserver.sh
RUN chmod +x /start.sh /nginx.sh /ssserver.sh

# 暴露端口
EXPOSE 80 443 8095

# 启动脚本
CMD ["/start.sh"]
