# dovecot

IMAP + LMTP server. Attach your config to `/etc/dovecot/local.conf`. Mailboxes
will be kept in `/var/spool/mail`. Set your mail servers external name via the
`DOVECOT_HOSTDOMAIN` and timezone for logging via `TZ` environment variables.

X.509 key and certificate (with full chain) need to be attached to
`/etc/ssl/dovecot/server.key` and `/etc/ssl/dovecot/server.pem`.

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
