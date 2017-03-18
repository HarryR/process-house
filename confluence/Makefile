CONTAINER=cptactionhank/atlassian-confluence
NAME=confluence

all: var logs

var:
	mkdir -p $@
	chown daemon: $@

logs:
	mkdir -p $@
	chown daemon: $@

pull:
	docker pull $(CONTAINER)

start:
	docker start $(NAME)

stop:
	docker stop $(NAME)

destroy:
	docker rm $(NAME) -f

create: var logs
	docker run -d --name $(NAME) --publish "8090:8090" --restart=unless-stopped -v `pwd`/var:/var/atlassian/confluence -v `pwd`/logs:/opt/atlassian/confluence/logs --link=confluence-psql -ti $(CONTAINER)

backup: var logs
	../backup.sh $+
