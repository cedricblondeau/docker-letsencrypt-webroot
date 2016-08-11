FROM quay.io/letsencrypt/letsencrypt
MAINTAINER Cédric Blondeau <hi@cedricblondeau.com>

RUN mkdir -p /var/log/letsencrypt \
    && mkdir -p /srv/www/letsencrypt \
    && mkdir -p /etc/letsencrypt \
    && useradd -u 1250 -M -r letsencrypt \
    && chown -R letsencrypt: /etc/letsencrypt \
    && chown -R letsencrypt: /srv/www/letsencrypt \
    && chown -R letsencrypt: /var/lib/letsencrypt \
    && chown -R letsencrypt: /var/log/letsencrypt

ADD entrypoint.sh /opt/entrypoint.sh

WORKDIR /opt
USER letsencrypt

ENTRYPOINT [ "/bin/bash", "/opt/entrypoint.sh" ]