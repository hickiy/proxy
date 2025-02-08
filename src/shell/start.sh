#!/bin/sh
echo "Starting Shadowsocks server..."

# Configure Shadowsocks
cat <<EOF >/etc/shadowsocks-libev/config.json
{
    "server":"0.0.0.0",
    "server_port":8095,
    "password":"${PASSWORD}",
    "timeout":300,
    "method":"aes-256-gcm",
    "fast_open":false
}
EOF

# Start Shadowsocks
ss-server -c /etc/shadowsocks-libev/config.json
