# 声明基础镜像 debian
FROM debian:latest

# 安装 systemd 、shadowsocks-libev、清理缓存
RUN apt-get update && \
    apt-get install -y shadowsocks-libev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 复制启动脚本
COPY ./src/shell/start.sh /start.sh

# 设置启动脚本权限
RUN chmod +x /start.sh

# 暴露端口
EXPOSE 8095

# 启动命令
CMD ["/start.sh"]
