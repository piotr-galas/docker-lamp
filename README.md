instaling lamp server based on
http://www.hnwatcher.com/r/1311411/Development-environments-in-docker-containers-the-idiomatic-way

Some change in apache based on:
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu

Some change in mysql based on:

https://github.com/tutumcloud/tutum-docker-mysql (run.sh)


To run lamp server please do following instructions

creating docker container:

container for mysql data (it is required)

1. Create hidden folder on your local machine
    mkdir ~/.data
2. Create data container sharing data folder
   docker run -d -v ~/.data:/data --name data ubuntu:14.04

3 Create mysql container
    docker run -d --volumes-from data --name mysql mysql

4 You can connect to it from console. To do this create another container
   docker run -i -t --link mysql:db --entrypoint bash mysql

   and you can login by type: mysql -u admin -p -h db