FROM alpine:3.10
RUN apk add --no-cache dovecot>2.3.7.2-r0 dovecot-mysql dovecot-lmtpd dovecot-pigeonhole-plugin tzdata && \
    mkdir /run/dovecot /var/spool/mail
COPY src /etc/dovecot/conf.d

# dovecot needs root access to bind ports below 1024, but will drop privileges
USER root:root
EXPOSE 24/tcp 143/tcp 993/tcp
VOLUME /var/spool/mail /run/dovecot /tmp /var/lib/dovecot

CMD ["/usr/sbin/dovecot", "-F"]
