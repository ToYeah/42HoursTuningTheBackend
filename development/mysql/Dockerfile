FROM mysql:8.0

COPY ./custom.conf /etc/mysql/conf.d/mysql.cnf

RUN mkdir -p /var/log/mysql/own/
RUN touch /var/log/mysql/own/slow.log
RUN chmod 777 /var/log/mysql/own/slow.log

CMD ["mysqld"]
