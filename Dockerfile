FROM alpine:3.11
 
MAINTAINER Alexander Held "contact@alexanderheld.net"
LABEL "org.opencontainers.image.created" "2020-02-15T19:16:30+00:00"
LABEL "org.opencontainers.image.authors" "Alexander Held"
LABEL "org.opencontainers.image.title" "git-sync-runner"
LABEL "org.opencontainers.image.version" "1.0.1"
LABEL "org.opencontainers.image.description" "Mirrors one git repo to another repo using OpenSSH keys. \
 It may get triggered by a new commit on some remote / ci pipeline."

 RUN apk update && apk upgrade && \
     apk add --no-cache git openssh-client && \
     echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
