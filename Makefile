STACK=ci-stack
VERSION=$(git describe --tags --always --dirty='-dev')

.PHONY: deploy rm-all rm-jenkins

all: deploy

deploy:
	docker stack deploy -c ci-stack.yaml $(STACK)

init:
	docker swarm init
	printf "example-password" | docker secret create example-password-v1 -

jenkins: rm-jenkins
	make -C jenkins build
	make deploy

rm-jenkins:
	docker service rm $(STACK)_jenkins

rm-all:
	docker stack rm $(STACK)