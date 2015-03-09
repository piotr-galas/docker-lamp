FROM ubuntu:14.04

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-client mysql-server

VOLUME ["/data"]

ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD run.sh /run.sh
RUN chmod +x run.sh

EXPOSE 3306

ENTRYPOINT ["/run.sh"]