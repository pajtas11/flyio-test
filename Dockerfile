FROM nginx:stable-alpine

COPY ./static /usr/share/nginx/html
COPY ./nginx.conf.template /etc/nginx/templates/nginx.conf.template
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8080

CMD ["/entrypoint.sh"]
