# start image from scratch
FROM debian:12

# run a command
RUN apt update -y && apt install -y openssl nginx \
        && rm -rf /var/lib/apt/lists/*

# run a command
RUN rm -rf /usr/share/nginx/html/* \
        && rm -f /etc/nginx/sites-enabled/default

# run a command
RUN echo 'server {' > /etc/nginx/sites-available/default && \
    echo '    listen 80 default_server;' >> /etc/nginx/sites-available/default && \
    echo '    listen [::]:80 default_server;' >> /etc/nginx/sites-available/default && \
    echo '    root /usr/share/nginx/html;' >> /etc/nginx/sites-available/default && \
    echo '    index index.html;' >> /etc/nginx/sites-available/default && \
    echo '    location / {' >> /etc/nginx/sites-available/default && \
    echo '        try_files $uri $uri/ =404;' >> /etc/nginx/sites-available/default && \
    echo '    }' >> /etc/nginx/sites-available/default && \
    echo '}' >> /etc/nginx/sites-available/default && \
    # creat a symblik link
    ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# copy file into container
COPY tools/index.html /usr/share/nginx/html/index.html

# open 80
EXPOSE 80

# main PID1
CMD [ "nginx", "-g", "daemon off;" ]