#!/bin/sh

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
