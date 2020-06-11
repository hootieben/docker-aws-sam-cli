NAME := hootieben/aws-sam-cli
TAG := 0.52.0
IMG := ${NAME}:v${TAG}
LATEST := ${NAME}:latest

build:
	@docker build --build-arg VERSION=${TAG} -t ${IMG} .
	@docker tag ${IMG} ${LATEST}

push:
	@docker push ${IMG}

CMD := docker run -it --rm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v "$(PWD)":/var/opt \
	-v "$(HOME)"/.aws:/root/.aws \
	-p "3000:3000" \
	-p "3001:3001" \
	hootieben/aws-sam-cli

help:
	@$(CMD)

info:
	@$(CMD) --info

version:
	@$(CMD) --version
