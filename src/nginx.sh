#!/bin/sh

# Nginx
nginx -g "daemon off;"

# certbot
# 验证域名并获取SSL证书
certbot --nginx -d caijinbo.top

# 自动续期
certbot renew --dry-run

# 重启Nginx
nginx -s reload
