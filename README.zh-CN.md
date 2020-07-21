# benzbrake/transmission

[Transmission](https://www.transmissionbt.com/) 是一种BitTorrent客户端，特点是一个跨平台的后端和其上的简洁的用户界面。Transmission以MIT许可证和GNU通用公共许可证双许可证授权，因此是一款自由软件。

![transmission](https://github.com/benzBrake/Docker-Transmission/raw/master/transmission.png)

## 注意

如果你是用于`pt`，请使用`pt`标签。

## 支持架构

*  arm
*  s390x
*  ppc64le
*  amd64
*  arm64
*  386

## 使用方法

以下是一些示例片段，可帮助您开始创建容器。

### 直接使用 docker 命令创建容器

```
docker create \
  --name=transmission \
  -e TR_USERNAME=transmission `#可选` \
  -e TR_PASSWORD=XxkasNdBu2iPgXcP `#可选` \
  -e TR_RPCPORT=9091 `#optional` \
  -e TR_PEERPORT=51413 `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v path to data:/var/lib/transmission \
  --restart unless-stopped \
  benzbrake/transmission
```

### 使用 docker-compose 管理容器

支持 docker-compose v2 语法

```
---
version: "3"
services:
  transmission:
    image: benzbrake/transmission
    container_name: transmission
    environment:
      - PUID=1000
      - PGID=1000
      - TR_USERNAME=transmission #可选
      - TR_PASSWORD=XxkasNdBu2iPgXcP #可选
      - TR_RPCPORT=9091 #optional
      - TR_PEERPORT=51413 #optional
    volumes:
      - path to data:/var/lib/transmission
    ports:
      - 9091:9091
      - 51413:51413
      - 51413:51413/udp
    restart: unless-stopped
```

## 参数

容器映像是使用在运行时传递的参数（例如上述参数）进行配置的。 这些参数用冒号分隔，并分别表示“外部:内部”。例如，-p 8080:80可以把容器的80端口暴露为宿主机的8080端口以便于容器外通过8080端口访问容器的80端口。


| 参数                  | 功能                                        |
| -------------------------- | ----------------------------------------------- |
| `-p 9091`                  | 暴露网页/RPC 端口 (TR_RPCPORT)         |
| `-p 51413`                 | 暴露BT 通信 TCP 端口 (TR_PEERPORT)      |
| `-p 51413/udp`             | 暴露BT 通信 UDP 端口 (TR_PEERPORT) |
| `-e TR_USERNAME`           | RPC 用户名                                 |
| `-e TR_PASSWORD `          | RPC 密码                               |
| `-e TR_RPCPORT`            | 应用网页/RPC 端口                  |
| `-e TR_PEERPORT`           | 应用通信端口             |
| `-e PUID`                  | 运行用户ID                              |
| `-e PGID`                  | 运行组ID                                 |
| `-v /var/lib/transmission` | Transmission 数据挂载路径 |

## 用户 ID / 组 ID 参数
如果使用了卷挂在参数 (-v flags), 宿主机和容器之间必定会存在权限问题，为了避免这个问题请指定运行用户ID/组ID参数。

获取用户和用户组ID：

```
$ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```
## 支持信息

- 进入容器内部运行命令: `docker exec -it transmission /bin/sh`
- 查看容器日志: `docker logs -f transmission`

# 授权

如果觉得好可以送我一杯咖啡

[![Buy Ryan A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png "Buy Ryan A Coffee")](https://www.buymeacoffee.com/buyryanacoffie "Buy Ryan A Coffee")

然后，随便 Copy。