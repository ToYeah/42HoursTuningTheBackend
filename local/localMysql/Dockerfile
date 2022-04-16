FROM mysql:8.0

COPY ./custom.conf /etc/mysql/conf.d/mysql.cnf
COPY ./sql/V0.sql /docker-entrypoint-initdb.d/1_init.sql
COPY ./sql/2_loadTestData.sql /docker-entrypoint-initdb.d/
COPY ./data/* /docker-entrypoint-initdb.d/
RUN apt-get update && apt-get -qq install -y --no-install-recommends libevent-dev
CMD ["mysqld"]