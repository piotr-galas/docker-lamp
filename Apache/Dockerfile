#DOCKER-VERSION 1.1.2

# Build the image of ubuntu 14.04 LTS
FROM ubuntu:14.04


# Run apt-get update
RUN apt-get -y update

# Install Apache, PHP and stuff
RUN apt-get -y install apache2
RUN apt-get -y install php5 libapache2-mod-php5 php5-mcrypt
RUN apt-get -y install libapache2-mod-auth-mysql php5-mysql

# Expose port 80 to the host machine
EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]