# start image from scratch
FROM debian:12

# run a command
RUN apt update -y && apt install -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# run a command
# -C (change into a dir before anything)
RUN wget https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz \
    && tar -xzf portainer-2.19.4-linux-amd64.tar.gz -C /opt \
    && rm portainer-2.19.4-linux-amd64.tar.gz \
    && chmod +x /opt/portainer/portainer

# run a command
RUN mkdir -p /data

# open 9443
EXPOSE 9443

# main PID1
CMD ["/opt/portainer/portainer", "--bind-https=:9443"]