#!/bin/bash

# ============ URL 备用列表 ============
V2RAY_URLS=(
"https://github.com/Alvin9999-newpac/fanqiang/wiki/v2ray%E5%85%8D%E8%B4%B9%E8%B4%A6%E5%8F%B7"
"https://bgithub.xyz/Alvin9999-newpac/fanqiang/wiki/v2ray%E5%85%8D%E8%B4%B9%E8%B4%A6%E5%8F%B7"
)

SSR_URLS=(
"https://github.com/Alvin9999-newpac/fanqiang/wiki/ss%E5%85%8D%E8%B4%B9%E8%B4%A6%E5%8F%B7"
"https://bgithub.xyz/Alvin9999-newpac/fanqiang/wiki/ss%E5%85%8D%E8%B4%B9%E8%B4%A6%E5%8F%B7"
)

OUT_FILE="links.txt"
NOW=$(date +"%Y-%m-%d %H:%M:%S")

echo "#Date: $NOW" > $OUT_FILE


# ============ 通用函数：找可用URL ============
find_available_url() {
    local urls=("$@")
    for url in "${urls[@]}"; do
        echo "Checking: $url" >&2
        if curl -s --head --connect-timeout 3 --max-time 5 "$url" | grep -q "HTTP/2 200"; then
            echo "✔ Available: $url" >&2
            echo "$url"
            return 0
        else
            echo "✘ Failed: $url" >&2
        fi
    done
    return 1
}


# ============ 选择可用源 ============
V2RAY_URL=$(find_available_url "${V2RAY_URLS[@]}")
SSR_URL=$(find_available_url "${SSR_URLS[@]}")

echo "================ Result ================"
echo "V2RAY_URL => ${V2RAY_URL:-NOT FOUND}"
echo "SSR_URL   => ${SSR_URL:-NOT FOUND}"
echo "========================================"

# ============ 校验 ============
if [[ -z "$V2RAY_URL" || -z "$SSR_URL" ]]; then
    echo "ERROR: No available source found!"
    exit 1
fi

# ============ 抓取内容 ============
echo "# v2ray: vmess/vless" >> $OUT_FILE
curl -s "$V2RAY_URL" \
| grep -oP '(?<=data-snippet-clipboard-copy-content=")[^"]+' \
>> $OUT_FILE

echo "# ssr: ss/ssr" >> $OUT_FILE
curl -s "$SSR_URL" \
| grep -oP '(?<=data-snippet-clipboard-copy-content=")[^"]+' \
>> $OUT_FILE

echo "Done ✔ Output => $OUT_FILE"
