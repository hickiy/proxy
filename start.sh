#!/bin/bash
if [ ! -f "/etc/letsencrypt/live/caijinbo.top/fullchain.pem" ]; then
  echo "通过certbot + http-01方式申请证书"
  certbot certonly --standalone --non-interactive --agree-tos --email 596310898@163.com -d caijinbo.top
  if [ $? -eq 0 ]; then
    echo "证书申请成功"
  else
    echo "证书申请失败"
  fi
else
  echo "证书已存在，跳过申请"
fi

# 生成0-5点之间的随机小时和分钟
RANDOM_HOUR=$((RANDOM % 6))
RANDOM_MINUTE=$((RANDOM % 60))

# 设置cron任务，在随机时间执行证书更新
echo "$RANDOM_MINUTE $RANDOM_HOUR * * * /renew.sh" >/tmp/crontab_new
crontab /tmp/crontab_new
rm /tmp/crontab_new

nginx -t
if [ $? -eq 0 ]; then
  echo "nginx启动成功"
  nginx -g 'daemon off;'
else
  echo "nginx启动失败"
  exit 1
fi
