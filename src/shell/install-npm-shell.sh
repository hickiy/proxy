
#!/bin/bash
 
# 安装vue 环境
 
# 更新源
sudo apt-get update
 
# 安装 npm
sudo apt-get -y install npm
npm -v
 
#更换 npm 淘宝源
sudo npm config set registry https://registry.npm.taobao.org/
echo "=====更换npm源====="
sudo npm config get registry
 
#npm 自更新
sudo npm install -g npm
#/usr/bin/npm -> /usr/lib/node_modules/npm/bin/npm-cli.js
#/usr/bin/npx -> /usr/lib/node_modules/npm/bin/npx-cli.js
 
#安装vue vue-cli
sudo npm install --global vue
sudo npm install --global vue-cli
