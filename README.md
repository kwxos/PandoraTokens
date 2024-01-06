### 环境变量
### 在有docker的服务器中运行pandoranext-tokentool和pandoranext
| 参数 | 是否必要 | 说明 |示例|
| ---- | ---- | ---- | ---- |
| new |   否   |   重启docker更新两个程序"1"为开启重启更新不使用此参数则重启不更新   | 1 |
| PT_PORT |   否   |pandoranext-tokentool的端口,默认8081，建议修改|8081|
|Pdlport|否|pandoranext的端口，默认8181，建议修改|8181|
|proxy_api_prefix|是|proxy接口前缀,用于热重载|kwxosbig|
|setup_password|是|proxy接口前缀,用于热重载的密码|kwxosbig.bast|
|licid|是|pandoranext运行必的要参数，在https://dash.pandoranext.com/获取|yxxxxxevjZxxxFg9xxxxxE|
### docker命令运行：
```
docker run \
    -itd \
    --name pandoratokentool \
    --restart always \
    --network=host \
    -e new=1 \
    -e PT_PORT=8081 \
    -e Pdlport=8181 \
    -e proxy_api_prefix=kwxosbig \
    -e setup_password=kwxosjyancan. \
    -e licid="yxxxxxevjZxxxFg9xxxxxE" \
    -v $(pwd)/PandoraNextToken:/data \
    kwxos/pandoratokentool:latest
```
### 在paas免费容器中运行pandoranext-tokentool和pandoranext
| 参数 | 是否必要 | 说明 |示例|
| ---- | ---- | ---- | ---- |
| new |否|重启docker更新两个程序"1"为开启重启更新不使用此参数则重启不更新| 1 |
| PT_PORT |否|pandoranext-tokentool的端口,默认8081，建议修改|8081|
|Pdlport|否|pandoranext的端口，默认8181，建议修改|8181|
|proxy_api_prefix|是|proxy接口前缀,用于热重载|kwxosbig|
|setup_password|是|proxy接口前缀,用于热重载的密码|kwxosbig.bast|
|licid|是|pandoranext运行必的要参数，在https://dash.pandoranext.com/获取|yxxxxxevjZxxxFg9xxxxxE|
|CFtoken|是|coudflare的Tunnels所建的token|exxxxxxxxIxiLCJxxxxxTx0xk3YzQxxxxi|
|NZ_HOST|是|哪吒面板的域名|nezha.xxx.xxx|
|NZ_PORT|是|哪吒面板的端口，当为443时，自动开启tls|443|
|NZ_PASSWORD|是|哪吒面板后所创建的秘钥|asxxxxxxxfswd|
