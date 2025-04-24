FROM debian:latest

# 设置时区
ENV TZ=Asia/Beijing

# 安装nginx certbot cron
RUN apt-get update && \
    apt-get install -y cron nginx certbot && \
    rm -rf /var/lib/apt/lists/*

# 复制nginx配置文件
COPY ./ecs.nginx.conf /etc/nginx/conf.d/ecs.nginx.conf
# 复制启动脚本
COPY ./start.sh /start.sh
# 复制证书更新脚本
COPY ./renew.sh /renew.sh

RUN chmod +x /start.sh 
RUN chmod +x /renew.sh

VOLUME ["/etc/letsencrypt"]

EXPOSE 80
EXPOSE 443

CMD ["/start.sh"]