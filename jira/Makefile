CONTAINER=cptactionhank/atlassian-jira
NAME=jira

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
	docker run -d --name $(NAME) --publish "8080:8080" --restart unless-stopped -v `pwd`/var:/var/atlassian/jira -v `pwd`/logs:/opt/atlassian/jira/logs --link=jira-psql -ti $(CONTAINER)
