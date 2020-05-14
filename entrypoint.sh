#!/usr/bin/env sh
set -e

if [[ -z "$VPC_CIDR" ]] ; then
  echo "VPC_CIDR not set!"
  exit 1
fi

[ -z "$APP_PORT" ] && export APP_PORT=3000
[ -z "$APP_HOST" ] && export APP_HOST=localhost

# populate the nginx config with our host, port and cidr values
envsubst '${APP_PORT} ${APP_HOST} ${VPC_CIDR}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# generate a self-signed cert
mkdir /etc/nginx/ssl
openssl req -subj "/CN=${APP_HOST}" -x509 -newkey rsa:4096 -nodes -days 365 \
  -keyout /etc/nginx/ssl/key.pem \
  -out /etc/nginx/ssl/cert.pem

exec "$@"
