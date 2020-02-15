FROM alpine:3.11

RUN apk update && apk upgrade && \
    apk add --no-cache git openssh-client && \
    echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
