FROM alpine:3.20

LABEL org.opencontainers.image.authors="Simon Rupf <simon@rupf.net>" \
      org.opencontainers.image.source=https://github.com/simonrupf/docker-dovecot \
      org.opencontainers.image.version="${VERSION}"

RUN apk upgrade --no-cache && \
    apk add --no-cache dovecot dovecot-mysql dovecot-lmtpd dovecot-pigeonhole-plugin tzdata && \
    mkdir /run/dovecot && \
    sed -i 's|^#!/usr/bin/env bash$|#!/bin/sh|' /usr/libexec/dovecot/health-check.sh
COPY src /etc/dovecot/conf.d

# dovecot needs root access to bind ports below 1024, but will drop privileges
USER root:root
EXPOSE 24/tcp 143/tcp 993/tcp
VOLUME /var/mail /run/dovecot /tmp /var/lib/dovecot

CMD ["/usr/sbin/dovecot", "-F"]
HEALTHCHECK CMD ["sh", "-c", "echo PING | nc 127.0.0.1 5001 | grep -q PONG"]
