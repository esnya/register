FROM alpine:edge
MAINTAINER ukatama dev.ukatama@gmail.com

RUN apk add -X http://dl-3.alpinelinux.org/alpine/edge/testing/ --no-cache etcd

ADD register.sh /usr/local/bin/register.sh

ENTRYPOINT ["/usr/local/bin/register.sh"]
