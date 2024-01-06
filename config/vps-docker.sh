#!/bin/bash
echo "VPS-docker模式" >> /data/logs/$(date +"%Y-%m-%d")logs.txt
mkdir /data/logs
PANDORA_NEXT_DATA="/data"
PT_PORT=${PT_PORT:-8081}
Pdlport=${Pdlport:-8181}
pandora_version=$(curl -s "https://api.github.com/repos/pandora-next/deploy/releases/latest" | jq -r .tag_name)
new_url=$(curl -s "https://api.github.com/repos/Yanyutin753/PandoraNext-TokensTool/releases/latest" | jq -r .assets[0].browser_download_url)
tokensTool_version=$(echo "$new_url" | sed 's|https://github.com|https://hub.fastgit.org|g')
filenames=$(curl -s "https://api.github.com/repos/Yanyutin753/PandoraNext-TokensTool/releases/latest" | jq -r .assets[0].name)
arch=$(uname -m)
case $arch in
    i386) filename="PandoraNext-${pandora_version}-linux-386-e1cae28.tar.gz" ume=386;;
    aarch64) filename="PandoraNext-${pandora_version}-linux-arm-e1cae28.tar.gz" ume=arm;;
    arm64) filename="PandoraNext-${pandora_version}-linux-arm64-e1cae28.tar.gz" ume=arm64;;
    x86_64) filename="PandoraNext-${pandora_version}-linux-amd64-e1cae28.tar.gz" ume=amd64;;
    *)
        echo "没有该系统架构运行包" >> /data/logs/$(date +"%Y-%m-%d")logs.txt
        exit 1
        ;;
esac
if [ ! -f "$filename" ]; then
    if [ ! -f "PandoraNext" ]; then
        echo "下载：$filename与$filenames" >> /data/logs/$(date +"%Y-%m-%d")logs.txt
        rm -rf PandoraNext-* /data/license.jwt PandoraNext look
        wget "https://hub.fastgit.org/pandora-next/deploy/releases/download/$pandora_version/$filename"
        if [ ! -f "filenames" ]; then
            rm -rf pandoraNext-*
            wget "$tokensTool_version"
        fi
        tar -xzvf "$filename"
        cp -r "PandoraNext-${pandora_version}-linux-${ume}-e1cae28"/PandoraNext .
        cp -n "PandoraNext-${pandora_version}-linux-${ume}-e1cae28"/config.json /data/
        cp -n "PandoraNext-${pandora_version}-linux-${ume}-e1cae28"/tokens.json /data/
        chmod a+x PandoraNext look
        rm -rf "PandoraNext-${pandora_version}-linux-${ume}-e1cae28"
        sed -i 's/"bind": "127.0.0.1:8181"/"bind": "0.0.0.0:'"$Pdlport"'"/' /data/config.json
        sed -i 's/"license_id": ""/"license_id": "'"$licid"'"/' /data/config.json
        echo "下载完成" >> /data/logs/$(date +"%Y-%m-%d")logs.txt
    else
        if [  "$new" = 1  ]; then
            echo "更新：$filename和$filenames" >> /data/logs/$(date +"%Y-%m-%d")logs.txt
            rm -rf PandoraNext-* /data/license.jwt PandoraNext pandoraNext-*
            wget "https://hub.fastgit.org/pandora-next/deploy/releases/download/$pandora_version/$filename"
            tar -xzvf "$filename"
            cp -r "PandoraNext-${pandora_version}-linux-${ume}-e1cae28"/PandoraNext .
            chmod a+x PandoraNext
            rm -rf "PandoraNext-${pandora_version}-linux-${ume}-e1cae28"
            sed -i 's/"bind": "127.0.0.1:8181"/"bind": "0.0.0.0:'"$Pdlport"'"/' /data/config.json
            sed -i 's/"license_id": ""/"license_id": "'"$licid"'"/' /data/config.json
            sed -i 's/"proxy_api_prefix": ""/"proxy_api_prefix": "'"$proxy_api_prefix"'"/' /data/config.json
            sed -i 's/"setup_password": ""/"proxy_api_prefix": "'"$setup_password"'"/' /data/config.json
            echo "更新完成" >> /data/logs/$(date +"%Y-%m-%d")logs.txt
        fi
    fi
else
    echo "必要文件已存在，无需下载" >> /data/logs/$(date +"%Y-%m-%d")logs.txt
fi
echo "运行PandoraNext" >> /data/logs/$(date +"%Y-%m-%d")logs.txt
/root/PandoraNext -config "${PANDORA_NEXT_DATA}/config.json" -tokens "${PANDORA_NEXT_DATA}/tokens.json" -license "${PANDORA_NEXT_DATA}/license.jwt" >> /data/logs/$(date +"%Y-%m-%d")logs.txt &
sleep 5
echo "运行tokentool" >> /data/logs/$(date +"%Y-%m-%d")logs.txt
java -jar "$filenames" --server.port=$PT_PORT --deployWay=releases --hotReload=true --deployPosition=/data --pandoara_Ip=127.0.0.1 >> /data/logs/$(date +"%Y-%m-%d")logs.txt &
