#!/bin/bash


if [ ! -d /data/mysql ]; then
    #setup mysqldb
    mysql_install_db --datadir=/data/mysql
    echo "=> Starting MySQL."
    /usr/bin/mysqld_safe --datadir=/data/mysql > /dev/null 2>&1 &

    StartMySQL
    CreateMySQLUser


else
    echo "=> continuing with an existsing mysql setup"
fi

echo "=> Running MySQL Server"
exec mysqld_safe --datadir=/data/mysql


StartMySQL ()
{
    /usr/bin/mysqld_safe > /dev/null 2>&1 &

    # Time out in 1 minute
    LOOP_LIMIT=13
    for (( i=0 ; ; i++ )); do
        if [ ${i} -eq ${LOOP_LIMIT} ]; then
            echo "Time out. Error log is shown as below:"
            tail -n 100 ${LOG}
            exit 1
        fi
        echo "=> Waiting for confirmation of MySQL service startup, trying ${i}/${LOOP_LIMIT} ..."
        sleep 5
        mysql -uroot -e "status" > /dev/null 2>&1 && break
    done
}

CreateMySQLUser()
{
    mysql -uroot -e "UPDATE user SET password=PASSWORD('mysqlpass') WHERE user='root';"

    mysqladmin -uroot shutdown
}