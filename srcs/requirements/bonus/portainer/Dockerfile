FROM debian:12

RUN apt update -y && apt install -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz \
    && tar -xzf portainer-2.19.4-linux-amd64.tar.gz -C /opt \
    && rm portainer-2.19.4-linux-amd64.tar.gz \
    && chmod +x /opt/portainer/portainer

RUN mkdir -p /data

EXPOSE 9443

CMD ["/opt/portainer/portainer", "--bind=:9000", "--bind-https=:9443"]