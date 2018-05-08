TAG := srwalker101/thewalke.rs:0.1.0

help:
	@echo "Commands: build, run, publish"

build:
	docker build -t $(TAG) .

run:
	docker run --rm -it $(TAG)

publish:
	@echo Publishing

.PHONY: help build run publish
