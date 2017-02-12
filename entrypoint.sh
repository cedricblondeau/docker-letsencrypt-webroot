#!/bin/bash

DOMAINS_CONF_FILE=/etc/letsencrypt/domains.conf
LE_CLI_FILE=/etc/letsencrypt/cli.ini

if [ ! -f $DOMAINS_CONF_FILE ]; then
    echo "$DOMAINS_CONF_FILE is missing."
    exit 1
fi

if [ ! -f $LE_CLI_FILE ]; then
    echo "$LE_CLI_FILE is missing."
    exit 1
fi

readarray DOMAINS < $DOMAINS_CONF_FILE

for HOST in "${DOMAINS[@]}"
do
    mkdir -p /srv/www/letsencrypt/$HOST

    certbot certonly \
    --config $LE_CLI_FILE \
    --webroot-path /srv/www/letsencrypt/$HOST \
    --domain $HOST \
    --non-interactive \
    --no-self-upgrade
done
