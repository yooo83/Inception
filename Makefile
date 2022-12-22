all:
	docker-compose -f srcs/docker-compose.yml up -d

stop:
	docker-compose -f srcs/docker-compose.yml down
	docker rmi srcs_nginx
	docker rmi srcs_mariadb
	docker rmi srcs_wordpress

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

wp:
	docker build -t wordpress ./srcs/requirements/wordpress
	docker run -d --name wordpress wordpress

stopwp:
	docker stop wordpress
	docker rm wordpress
	docker rmi wordpress

rmVolumes:
	rm -rf srcs/wordpress
	rm -rf srcs/mariadb
	
.phony: all stop nginx stopnginx db stopdb rmVolumes