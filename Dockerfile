FROM alpine:3.11

RUN apk update && apk upgrade && \
    apk add --no-cache git openssh-client && \
    echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

  
ADD https://raw.githubusercontent.com/net-engine/github-repository-sync-action/master/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
