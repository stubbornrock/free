#!/bin/bash

#https://dgithub.xyz/Alvin9999/new-pac/wiki#国内访问GitHub镜像，建议保存
#https://gitlab.com/zhifan999/fq/-/wikis#国内访问GitLab，建议保存
#https://s3.us-east-1.amazonaws.com/zhifan/wiki.html#长效，建议保存
#https://d2hw6evfrtyy0y.cloudfront.net#建议保存

#CHECK_URL="https://bgithub.xyz/Alvin9999/new-pac/wiki"
DOWNLAOD_URL="https://bgithub.xyz/Alvin9999/new-pac/wiki/%E9%AB%98%E5%86%85%E6%A0%B8%E7%89%88/"

mkdir -p tmphtmls

#wiki/chrome-download
#wget -q -O tmphtmls/wiki.html $CHECK_URL
#echo "最新的更新时间:"
#cat tmphtmls/wiki.html | grep -A1 '谷歌翻墙浏览器高内核版</a></td>' | tail -1 | sed -n 's/<td>\(.*\)<\/td>/\1/p'

#wiki/chrome-download
wget -q -O tmphtmls/download.html $DOWNLAOD_URL

package=$(cat tmphtmls/download.html | grep -A2 'Win11系统专用' | grep '压缩包名称' | grep _AllNew_ | sed -n 's/<li>压缩包名称：\(.*\)<\/li>/\1/p')
echo "最新压缩包名称：${package}"
echo "国外网盘下载地址："
cat tmphtmls/download.html | grep 国外云盘 | grep ${package} | grep -oP '(?<=href=")[^"]+'

read -p "请输出下载的地址：" url
wget $url
