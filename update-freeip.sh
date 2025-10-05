#!/bin/bash

#V2RAY_URL="https://bgithub.xyz/Alvin9999/new-pac/wiki/v2ray%E5%85%8D%E8%B4%B9%E8%B4%A6%E5%8F%B7"
#SSR_URL="https://bgithub.xyz/Alvin9999/new-pac/wiki/ss%E5%85%8D%E8%B4%B9%E8%B4%A6%E5%8F%B7"

V2RAY_URL="https://github.com/Alvin9999/new-pac/wiki/v2ray%E5%85%8D%E8%B4%B9%E8%B4%A6%E5%8F%B7"
SSR_URL="https://github.com/Alvin9999/new-pac/wiki/ss%E5%85%8D%E8%B4%B9%E8%B4%A6%E5%8F%B7"

NOW=$(date +"%Y-%m-%d %H:%M:%S")
echo "#Date: $NOW" > links.txt

################### method01

#mkdir -p tmphtmls
#
##v2ray
#wget -q -O tmphtmls/v2ray.html $V2RAY_URL
#wget -q -O tmphtmls/ssr.html $SSR_URL
#
#cp links.txt links.txt.old
#echo "#v2ary: vmess/vless" > links.txt
#grep -oP '(?<=data-snippet-clipboard-copy-content=")[^"]+' tmphtmls/v2ray.html >> links.txt
#echo "#ssr: ss/ssr" >> links.txt
#grep -oP '(?<=data-snippet-clipboard-copy-content=")[^"]+' tmphtmls/ssr.html >> links.txt

################### method02
curl -s $V2RAY_URL | grep -oP '(?<=data-snippet-clipboard-copy-content=")[^"]+' >> links.txt
curl -s $SSR_URL | grep -oP '(?<=data-snippet-clipboard-copy-content=")[^"]+' >> links.txt
