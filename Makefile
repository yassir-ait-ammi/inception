NAME = inception
COMPOSE = ./srcs/docker-compose.yml
DB_VOLUME = /home/yaait-am/data/mariadb/
WP_VOLUME = /home/yaait-am/data/wordpress/

up:
	sudo mkdir -p $(DB_VOLUME)
	sudo mkdir -p $(WP_VOLUME)
	sudo docker-compose -f $(COMPOSE) -p $(NAME) up --build -d 

down:
	sudo docker-compose -f $(COMPOSE) -p $(NAME) down

clean: down
	sudo docker volume rm $$(docker volume ls) 2> /dev/null || true
	sudo rm -rf $(DB_VOLUME) $(WP_VOLUME)

fclean: clean
	@docker rmi -f $$(docker images -qa) 2> /dev/null || true
