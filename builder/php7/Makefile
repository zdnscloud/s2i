IMAGE_NAME = zdnscloud/s2i-php-builder
TAG ?= latest

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run

docker:
	docker push $(IMAGE_NAME):$(TAG)
