OPERATOR_NAME  := namespace-rolebinding-operator
VERSION := $(shell date +%Y%m%d%H%M)
IMAGE := galkon/$(OPERATOR_NAME)

.PHONY: install_deps build

install_deps:
	glide install

bin/%/$(OPERATOR_NAME):
	GOOS=$* GOARCH=amd64 go build -v -i -o bin/$*/$(OPERATOR_NAME) ./cmd

build-image: bin/linux/$(OPERATOR_NAME)
	docker build . -t $(IMAGE):$(VERSION)