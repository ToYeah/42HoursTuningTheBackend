FROM openresty/openresty:1.19.9.1-10-alpine-apk

COPY custom.conf /etc/nginx/conf.d/default.conf
COPY post_file.lua /etc/nginx/post_file.lua
RUN  chmod 755 /etc/nginx/post_file.lua
RUN  apk update && apk add libmysqlclient-dev libssl-dev
# RUN mkdir tmp
# RUN cd tmp
# RUN curl -O http://luajit.org/download/LuaJIT-2.0.5.tar.gz
# RUN tar zxvf LuaJIT-2.0.5.tar.gz
# RUN cd LuaJIT-2.0.5
# RUN make PREFIX=/usr/local/luajit
# RUN sudo make install PREFIX=/usr/local/luajit
# RUN -L https://github.com/simpl/ngx_devel_kit/archive/v0.3.1.tar.gz -o ngx_devel_kit-v0.3.1.tar.gz
# RUN tar xzvf ngx_devel_kit-v0.3.1.tar.gz
# RUN curl -L https://github.com/openresty/lua-nginx-module/archive/v0.10.20.tar.gz -o ngx_lua-v0.10.20.tar.gz
# RUN tar zxvf ngx_lua-v0.10.20.tar.gz

CMD ["/usr/bin/openresty", "-g", "daemon off;"]