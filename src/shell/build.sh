#!/bin/bash
#前端打包脚本

confirm='N'
THEME=''

echo -e

# 选择环境
function chooseEnv() {
  echo '请根据角色选择对应的序号'
  select var in '泸州' '其他'; do
    case $var in
    '泸州')
      THEME='blue'
      break
      ;;
    '其他')
      THEME='green'
      break
      ;;
    *)
      echo -n '请你输入正确的选项序号：'
      continue
      ;;
    esac
  done
  echo 你选择了角色：$var
  echo 你选择的主题：$THEME
  isContain
}

function isContain() {
  while [[ $confirm != 'Y' && $confirm != 'y' ]]; do
    read -n1 -p '确认请输入Y/y, 重新选择请输入其他键：' confirm
    if [[ $confirm != 'Y' && $confirm != 'y' ]]; then
      echo -e '\n'
      chooseEnv
    fi
    echo -e '\n'
  done
}

function chooseBuildScript() {
  if [[ $THEME = 'blue' ]]; then
    npm run build:blue
    # echo -e 'blue'
  else
    npm run build
    # echo -e 'green'
  fi
}

# 选择环境
chooseEnv
echo -e '编译新版本...'
chooseBuildScript
echo -e tips: 打包完成!

exit 0
