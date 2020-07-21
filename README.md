# benzbrake/transmission

[中文说明](https://github.com/benzBrake/Docker-Transmission/raw/master/README.zh-CN.md)

[Transmission](https://www.transmissionbt.com/) is designed for easy, powerful use. Transmission has the features you want from a BitTorrent client: encryption, a web interface, peer exchange, magnet links, DHT, µTP, UPnP and NAT-PMP port forwarding, webseed support, watch directories, tracker editing, global and per-torrent speed limits, and more.

![transmission](https://github.com/benzBrake/Docker-Transmission/raw/master/transmission.png)

## Notice

If you are using for pt, please use tag **pt**.

## Supported Architectures

*  arm
*  s390x
*  ppc64le
*  amd64
*  arm64
*  386

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=transmission \
  -e TR_USERNAME=transmission `#optional` \
  -e TR_PASSWORD=XxkasNdBu2iPgXcP `#optional` \
  -e TR_RPCPORT=9091 `#optional` \
  -e TR_PEERPORT=51413 `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v path to data:/var/lib/transmission \
  --restart unless-stopped \
  benzbrake/transmission
```

### docker-compose

Compatible with docker-compose v2 schemas.

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
      - TR_USERNAME=transmission #optional
      - TR_PASSWORD=XxkasNdBu2iPgXcP #optional
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

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `external:internal` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter                  | Function                                        |
| -------------------------- | ----------------------------------------------- |
| `-p 9091`                  | WebUI/RPC Port                                  |
| `-p 51413`                 | Torrent Port TCP                                |
| `-p 51413/udp`             | Torrent Port UDP                                |
| `-e TR_USERNAME`           | RPC Username                                    |
| `-e TR_PASSWORD `          | RPC Password                                    |
| `-e TR_RPCPORT`            | WebUI/RPC Port                                  |
| `-e TR_PEERPORT`           | Peer Port                                       |
| `-e PUID`                  | Run as user                                     |
| `-e PGID`                  | Run as group                                    |
| `-v /var/lib/transmission` | Where transmission should store data and config |

## User / Group Identifiers
When using volumes (-v flags), permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user PUID and group PGID.
Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.
In this instance PUID=1000 and PGID=1000, to find yours use id user as below:
```
$ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```
## Support Info

- Shell access whilst the container is running: `docker exec -it transmission /bin/sh`
- To monitor the logs of the container in realtime: `docker logs -f transmission`

# License

If you feel this image is useful, you can buy me a coffee

[![Buy Ryan A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png "Buy Ryan A Coffee")](https://www.buymeacoffee.com/buyryanacoffie "Buy Ryan A Coffee")

Ant then, copy as you want.