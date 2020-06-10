FROM alpine:3.7

ENV VERSION=0.52.0

RUN apk add --no-cache curl python3 python3-dev musl-dev gcc && \
  curl -SLO https://github.com/awslabs/aws-sam-cli/archive/v${VERSION}.tar.gz && \
  tar -C /tmp -zxvf v${VERSION}.tar.gz && \
  rm -f v$VERSION.tar.gz && \
  pip3 install /tmp/aws-sam-cli-${VERSION}/. && \
  apk del curl python3-dev musl-dev gcc

WORKDIR /var/opt

EXPOSE 3000

ENTRYPOINT ["/usr/bin/sam"]
