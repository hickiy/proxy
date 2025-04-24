#!/bin/bash
echo "停止nginx以释放80端口..."
nginx -s stop || pkill nginx
sleep 3  # 等待nginx完全停止

echo "更新证书..."
certbot renew --quiet

echo "重新启动nginx..."
nginx
echo "证书更新流程完成于 $(date)"