MODULES=0bin gitea nodered confluence-psql confluence jira-psql jira

create:
	@for MOD in $(MODULES); do make -C $$MOD $@; done

start:
	@for MOD in $(MODULES); do make -C $$MOD $@; done

stop:
	@for MOD in $(MODULES); do make -C $$MOD $@; done

destroy:
	@for MOD in $(MODULES); do make -C $$MOD $@; done