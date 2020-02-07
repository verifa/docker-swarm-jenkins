IMAGE=jenkins-casc
VERSION=1.0

all: build

build:
	docker build -t $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):$(VERSION)

