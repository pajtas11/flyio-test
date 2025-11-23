#!/bin/sh
set -e

# Provide a default if PORT is not set
PORT=${PORT:-8080}
export PORT

# Replace $PORT in template and write nginx default conf
envsubst '$PORT' < /etc/nginx/templates/nginx.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
