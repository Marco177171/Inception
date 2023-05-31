all:
	@docker pull debian:buster
	@docker pull alpine:latest
	@docker volume create --name srcs_mariadb_data
	@docker volume create --name srcs_wordpress_data
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down
	@docker volume rm -f $$(docker volume ls -q)
	@docker image rm -f $$(docker image ls -q)

re:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -qa);
	@docker rm $$(docker ps -qa);
	@docker rm -f $$(docker images -qa);
	@docker volume rm $$(docker volume ls -q);
	@docker network rm $$(docker network ls -q);

.PHONY: all re down clean
