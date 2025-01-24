#!/bin/bash
#前端发布脚本
#H*%eM7Qt64Zf@gd
usename='root';
ip='localhost';
local_folder='dist';
server_folder='/home/module/network_fraud_warning/front/network-fraud-warning-show';

echo -e '删除本地文件';
# rm -rf ${local_folder};

echo -e '编译新版本...';
# npm run build
echo -e '备份服务器上旧版本文件';
ssh -p 2011 $usename@$ip "rm -rf ${server_folder}/*";
echo -e '发布新版本至服务器...';
scp -P 2011 -r ${local_folder}/* $usename@$ip:${server_folder};

echo "部署完毕";

