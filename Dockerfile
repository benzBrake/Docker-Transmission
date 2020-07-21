# Transmission image with trackers add script.
FROM benzbrake/alpine
MAINTAINER Ryan Lieu <github-benzBrake@woai.ru>

ENV TR_USERNAME="transmission" TR_PASSWORD="PEiktY3IEaeWluyS" TR_RPC_PORT="9091" TR_PEER_PORT="51413" PUID="1000" PGID="1000" "TR_SETTINGS"="settings.json"
ADD ["entrypoint.sh", "tracker.sh", "healthchek.sh", "settings.json", "/data/"]
RUN set -ex && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories &&\
    apk add --update --no-cache coreutils transmission-daemon transmission-cli su-exec && \
    mv /usr/share/transmission/web/index.html /usr/share/transmission/web/index.original.html && \
    TWC_VERSION=$(curl -s https://api.github.com/repos/ronggang/transmission-web-control/releases/latest | grep "tag_name" | cut -d \" -f 4) && \
    curl -sSL https://github.com/ronggang/transmission-web-control/archive/${TWC_VERSION}.zip -o /tmp/twc.zip && \
    cd /tmp && \
    unzip twc.zip &&\
    mv -f /tmp/transmission*/src/* /usr/share/transmission/web/ && \
    rm -rf /tmp/* &&\
    chmod +x /data/*.sh &&\
    crontab -u root -l 2>/dev/null | { cat; echo -e "*/1\t*\t*\t*\t*\tsh /data/tracker.sh 2>&1"; } | crontab -u root -

VOLUME /var/lib/transmission
EXPOSE 9091 51413/tcp 51413/udp
HEALTHCHECK --interval=5s --timeout=3s \
    CMD /data/healthchek.sh
CMD ["-f", "-g", "/var/lib/transmission"]
ENTRYPOINT ["/data/entrypoint.sh"]