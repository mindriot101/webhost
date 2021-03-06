VERSION := 0.1.0
TAG := srwalker101/thewalke.rs:$(VERSION)
RUN_NAME := webhost
RUN_CMD := docker run --rm -it -p 8081:80 -v $(shell pwd)/content:/usr/share/nginx/html:ro --name $(RUN_NAME)

help:
	@echo "Commands: build, run, shell, publish, detach, provision"

build:
	docker build -t $(TAG) .

run:
	$(RUN_CMD) $(TAG)

detach:
	$(RUN_CMD) -d $(TAG)

kill:
	docker kill $(RUN_NAME)

shell:
	$(RUN_CMD) $(TAG) /bin/bash

publish:
	@echo Publishing

provision:
	ansible-playbook site.yml

.PHONY: help build run publish shell provision
