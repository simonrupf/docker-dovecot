FROM alpine:3.11
RUN apk add --no-cache dovecot dovecot-mysql dovecot-lmtpd dovecot-pigeonhole-plugin tzdata && \
    mkdir /run/dovecot
COPY src /etc/dovecot/conf.d

# dovecot needs root access to bind ports below 1024, but will drop privileges
USER root:root
EXPOSE 24/tcp 143/tcp 993/tcp
VOLUME /var/mail /run/dovecot /tmp /var/lib/dovecot

CMD ["/usr/sbin/dovecot", "-F"]
