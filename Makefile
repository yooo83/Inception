all:
	docker-compose -f srcs/docker-compose.yml up -d

stop:
	docker-compose -f srcs/docker-compose.yml down
	docker rmi srcs_nginx
	docker rmi srcs_mariadb
	docker rmi srcs_wordpress

rmVolumes:
	sudo rm -rf ../../wordpress
	sudo rm -rf ../../mariadb

.phony: all stop