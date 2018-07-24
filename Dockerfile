FROM nginx:1.15

# Installing Certbot
RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y python-certbot-nginx -t stretch-backports && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/nginx/conf.d/*
COPY ./conf.d/ /etc/nginx/conf.d/

COPY ./letsencrypt/ /etc/letsencrypt/

COPY ./scripts/ /scripts/
RUN chmod +x /scripts/*.sh

VOLUME /etc/letsencrypt
EXPOSE 80 443

ENTRYPOINT []
CMD ["/bin/bash", "/scripts/start.sh"]