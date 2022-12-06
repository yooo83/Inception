all:
	docker-compose -f srcs/docker-compose.yml up -d

stop:
	docker-compose -f srcs/docker-compose.yml down
	docker rmi srcs-nginx
	docker rmi srcs-mariadb

nginx:
	docker build -t nginx ./srcs/requirements/nginx
	docker run -d -p 443:443 --name nginx nginx

stopnginx:
	docker stop nginx
	docker rm nginx
	docker rmi nginx

stopdb:
	docker stop mariadb
	docker rm mariadb
	docker rmi mariadb
db:
	docker build -t mariadb ./srcs/requirements/mariadb
	docker run -d --name mariadb mariadb

.phony: all stop nginx stopnginx db stopdb