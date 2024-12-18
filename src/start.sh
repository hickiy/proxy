#!/bin/sh

# Start the nginx server
service nginx start

# 执行certbot自动设置证书，-n表示非交互式，-d表示域名，--agree-tos表示同意协议，--email表示邮箱
certbot --nginx -d caijinbo.top --agree-tos --email 596310898@163.com --non-interactive

# 自动续期证书
certbot renew --dry-run

# 生成shadowsocks配置文件
cat <<EOF >/etc/shadowsocks-libev/config.json
{
  "server": "0.0.0.0",
  "server_port": 8095,
  "password": "${PASSWORD}",
  "timeout": 300,
  "method": "aes-256-gcm",
  "fast_open": false
}
EOF

# 启动shadowsocks
service shadowsocks-libev start
