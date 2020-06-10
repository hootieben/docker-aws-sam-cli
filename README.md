# docker-aws-sam-cli

## Overview

A container to run the AWS SAM CLI.

It's frustrating that homebrew is the "recommended" way to install
the AWS SAM CLI, since it takes over your local python installation.

## Ex usage:

This will mount your docker socket, your current working directory, 
and also your AWS credentials. The entrypoint is the sam binary, so 
any sam commands should work.

`
docker run -it --rm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v "$(PWD)":/var/opt \
	-v "$(HOME)"/.aws:/root/.aws \
	-p "3000:3000" \
	hootieben/aws-sam-cli
`
