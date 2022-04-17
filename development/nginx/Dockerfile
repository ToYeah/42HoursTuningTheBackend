FROM openresty/openresty:1.19.9.1-10-alpine-apk

COPY custom.conf /etc/nginx/conf.d/default.conf

CMD ["/usr/bin/openresty", "-g", "daemon off;"]