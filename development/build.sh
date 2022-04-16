#!/bin/bash

# ==================================
# ビルドスクリプト。
# ==================================

# web画面の変更を反映したい場合、コメントアウトを外す。
# (cd ./frontend && npm run build)

docker-compose down --rmi all -DWITH_INNODB_MEMCACHED=ON
docker-compose build --no-cache -DWITH_INNODB_MEMCACHED=ON
docker-compose up -d
