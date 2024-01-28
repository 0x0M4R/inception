volume_worepress = /home/${USER}/data/wp
volume_database  = /home/${USER}/data/mysql

all: makedir up

makedir:
	@mkdir -p $(volume_worepress) $(volume_database)

up:
	docker-compose -f ./srcs/docker-compose.yml up --build

stop:
	@docker compose -f ./srcs/docker-compose.yml down

clean: stop
	@docker system prune --volumes --all --force
	@docker rm -q $$(docker ps -qa) 2> /dev/null || true
	@docker rmi -f $$(docker images -qa) 2> /dev/null || true
	@docker volume rm $$(docker volume ls -q) 2> /dev/null  || true
	@sudo rm -rf /home/${USER}/data

re: clean all

.PHONY: all up stop clean re