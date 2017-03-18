# For more information, see:
# https://docs.gitea.io/en-us/install-with-docker/
# Here, we use the embedded SQLite database

CONTAINER=gitea/gitea
NAME=gitea

all: data

data:
	mkdir -p $@

pull:
	docker pull $(CONTAINER)

start:
	docker start $(NAME)

stop:
	docker stop $(NAME)

destroy:
	docker rm $(NAME) -f

create: data
	docker run -d --name $(NAME) -p 3022:22 -p "3000:3000" --restart unless-stopped -v `pwd`/data:/data  -ti $(CONTAINER)

backup: data
	../backup.sh $+
