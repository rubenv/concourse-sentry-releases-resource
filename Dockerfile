FROM alpine:latest

RUN apk add --update --upgrade --no-cache jq bash curl

ADD assets /opt/resource
RUN chmod +x /opt/resource/*

ENTRYPOINT [ "/bin/bash" ]
