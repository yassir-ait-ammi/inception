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
	sudo docker volume rm $$(sudo docker volume ls -q) 2> /dev/null || true
	sudo rm -rf $(DB_VOLUME) $(WP_VOLUME)

fclean: clean
	sudo docker rmi -f mariadb wordpress nginx redis ftp adminer static_file 2> /dev/null || true
	sudo docker image prune -f

fclean-all: fclean
	sudo docker rmi -f $$(sudo docker images -qa) 2> /dev/null || true
	sudo docker system prune -af --volumes

re: fclean up

.PHONY: up down clean fclean re fclean-all