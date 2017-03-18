CONTAINER=nodered/node-red-docker:slim
NAME=nodered

all: data

data:
	mkdir -p $@
	chmod 777 data

start:
	docker start $(NAME)

stop:
	docker stop $(NAME)

destroy:
	docker rm $(NAME) -f

create: data
	docker run -d --name $(NAME) --publish "1880:1880" --restart unless-stopped -v `pwd`/data:/data -ti $(CONTAINER)

backup: data
	../backup.sh $+
