CMD := docker run -it --rm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v "$(PWD)":/var/opt \
	-v "$(HOME)"/.aws:/root/.aws \
	-p "3000:3000" \
	hootieben/aws-sam-cli

help:
	@$(CMD)

build:
	docker build -t hootieben/aws-sam-cli .
