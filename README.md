# dovecot

IMAP + LMTP server. Attach your config to `/etc/dovecot/local.conf`. Mailboxes
will be kept in `/var/spool/mail`. Set your mail servers external name via the
`DOVECOT_HOSTDOMAIN` and timezone for logging via `TZ` environment variables.

X.509 key and certificate (with full chain) need to be attached to
`/etc/ssl/dovecot/server.key` and `/etc/ssl/dovecot/server.pem`.

## Environment variables

- `DOVECOT_HOSTDOMAIN`: this FQDN is displayed in the IMAP greeting
- `TZ`: timezone used for logging, defaults to UTC

## Persistent volumes

- `/etc/dovecot/local.conf`: for additional configurations - owner 0, group 0, mode 0644
- `/etc/dovecot/dovecot-sql.conf`: for SQL related configurations - owner 0, group 0, mode 0640
- `/etc/dovecot/dhparam.pem`: generate using `openssl dhparam -out /srv/mail/dovecot/dhparam.pem 4096` - owner 0, group 0, mode 0640
- `/var/spool/mail`: mailbox store - owner 8, group 12, mode 0750

## Network ports

- `24/tcp`: LMTP used by MTA for local delivery of mail
- `143/tcp`: IMAP
- `993/tcp`: IMAPS

## Usage

```shell
make run
```

## Stop

```shell
make clean
```

## Build

```shell
make build
```

## Build & run

```shell
make
```

## Debug image contents

```shell
make debug
```
