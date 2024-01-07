## 求⭐⭐⭐ star ⭐⭐⭐
### 在有docker的服务器中运行[pandoranext-tokentool](https://apifox.com/apidoc/shared-40345b46-9c9c-45cc-b494-6a6a387a978f/doc-3430733)和[pandoranext](https://github.com/pandora-next/deploy)
### 感谢[Yanyutin753](https://github.com/Yanyutin753)和[wozulong](https://github.com/wozulong)
| 参数 | 是否必要 | 说明 |示例|
| ---- | ---- | ---- | ---- |
| new |否|重启docker更新两个程序"1"为开启重启更新不使用此参数则重启不更新| 1 |
|PT_PORT|否|pandoranext-tokentool的端口,默认8081，建议修改|8081|
|Pdlport|否|pandoranext的端口，默认8181，建议修改|8181|
|licid|是|pandoranext运行必的要参数，在https://dash.pandoranext.com/  获取|yxxxxxevjZxxxFg9xxxxxE|
|Tool_path|是|Token-tool的URL自定义后缀，为了安全，建议增加|/tokensTool|
### docker命令运行：
### 运行时修改必要变量
```
docker run \
    -itd \
    --name pandoratokentool \
    --restart always \
    --network=host \
    -e new=1 \
    -e PT_PORT=8081 \
    -e Pdlport=8181 \
    -e licid="yxxxxxevjZxxxFg9xxxxxE" \
    -e Tool_path="/tokensTool" \
    -v $(pwd)/PandoraNextToken:/data \
    kwxos/pandoratokentool:latestvps
```
### docker-compose运行
### 下载docker-compose.yml
```
wget https://raw.githubusercontent.com/kwxos/PandoraTokens/main/docker-compose.yml
```
### 修改docker-compose.yml文件中的参数变量
### 然后运行
```
docker-compose up -d
```
### 在paas免费容器中运行pandoranext-tokentool和pandoranext
### 可以试试back4app，codesandbox.io，railway，uffizzi，fly.io，koybk，有koybk的可以试试，我在koybk上测试成功了
### 镜像

`kwxos/pandoratokentool:latestpaas`

| 参数 | 是否必要 | 说明 |示例|
| ---- | ---- | ---- | ---- |
| new |否|重启docker更新两个程序"1"为开启重启更新不使用此参数则重启不更新| 1 |
| PT_PORT |否|pandoranext-tokentool的端口,默认8081，建议修改|8081|
|Pdlport|否|pandoranext的端口，默认8181，建议修改|8181|
|licid|是|pandoranext运行必的要参数，在https://dash.pandoranext.com/  获取|yxxxxxevjZxxxFg9xxxxxE|
|CFtoken|是|coudflare的Tunnels所建的token|exxxxxxxxIxiLCJxxxxxTx0xk3YzQxxxxi|
|Tool_path|是|Token-tool的URL自定义后缀，为了安全，建议增加|/tokensTool|
|NZ_HOST|否|哪吒面板的域名，当不填时，将不会运行哪吒|nezha.xxx.xxx|
|NZ_PORT|否|哪吒面板的端口，当为443时，自动开启tls|443|
|NZ_PASSWORD|否|哪吒面板后所创建的秘钥|asxxxxxxxfswd|
### 示例：

![e778ec9117a9e9fc307b5ca48e81d854](https://github.com/kwxos/PandoraTokens/assets/102129419/718ec475-3d69-4b6d-bcd7-f44a28aacdcc)

### 参数示例

![5a4aa9073865c06705e26753cc3acca1](https://github.com/kwxos/PandoraTokens/assets/102129419/426fd86d-4bfe-44f0-ab5e-4e50b3d2b7ee)

### 容器平台释放端口

![7d5c18e7c188a1c290c7023f077dd214](https://github.com/kwxos/PandoraTokens/assets/102129419/daae96da-f5ce-4d33-b2fb-220b0ebc2fd2)

### 获取CFtoken
| 为了 | 看起来 | 好看 |
| ---- | ---- | ---- |
|![80231c47c558df1b0228e76b48aa8fb4](https://github.com/kwxos/PandoraTokens/assets/102129419/0450324a-cb7a-4121-947b-c2801b2c1c59)|![59db6687d9e7e2debfe606155f6ea487](https://github.com/kwxos/PandoraTokens/assets/102129419/f0432da7-4a2b-434b-b36b-eda9aa0cb5e8)|![4928f6e8ca0d036fc46feb7dae2b48f6](https://github.com/kwxos/PandoraTokens/assets/102129419/1c2c98ba-6d0a-4249-bc53-e7dbdc7510ef)|
|![df4376de54ba49c2dd10e6c86cf71bf4](https://github.com/kwxos/PandoraTokens/assets/102129419/637fff5b-702c-4c71-8101-4c04a020e077)|![25c17681bedd1fae3dd7ef7ab83d2079](https://github.com/kwxos/PandoraTokens/assets/102129419/19465e46-10c6-4c2d-9c3e-1395d3ed2e82)|![bc5f019a1925d940d95106aa9e6168b1](https://github.com/kwxos/PandoraTokens/assets/102129419/89050ce9-014b-4dd6-9824-d0885efe7ef0)|

### 哪吒面板
#### 哪吒文档：https://nezha.wiki/

#### fly搭建哪吒：https://blog.kwxos.top/posts/97.html

#### 有偿帮搭建哪吒，在博客评论区联系


