FROM nginx:stable-alpine

# add openssl so we can generate a cert at runtime
RUN apk add --no-cache openssl

COPY nginx.conf.template /etc/nginx/nginx.conf.template

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]
