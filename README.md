MYSQL:
docker run -td --name xerte_mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:stable

XERTE: 
docker run -td --name=xerte -p 8080:80 --link xerte_mysql:mysql shols/xerte_docker

SETUP:
docker inspect xerte_mysql | grep "IPAddress"

//Grab the IP of the MYSQL and pass it to the mysql host with the port affixed i.e. 172.17.03:3306


ALL:

docker run -td --name xerte_mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:8.0 && docker run -td --name=xerte -p 8080:80 --link xerte_mysql:mysql shols/xerte_docker && docker inspect xerte_mysql | grep "IPAddress"


The xerte installation is now waiting on localhost:8080



Bonus:


MYSQL CLI:
docker run -it --link xerte_mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

MYSQL Terminal:
docker exec -it xerte_mysql /bin/bash