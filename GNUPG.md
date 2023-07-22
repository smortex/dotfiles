# GnuPG

## Setup a Yubikey

Define `GNUPGHOME` to a copy of the `.gnupg` directory containing the complete key.

Ensure gpg-agent / scdaemon are not running with the older path:

```
$ gpgconf --kill gpg-agent
$ export GNUPGHOME=/tmp/.gnupg
$ gpg --edit-key romain@FreeBSD.org
gpg> keytocard
...
gpg> key 1
gpg> keytocard
...
gpg> save
$ unset GNUPGHOME
$ gpgconf --kill gpg-agent
```

* [Using Your YubiKey with OpenPGP](https://support.yubico.com/hc/en-us/articles/360013790259-Using-Your-YubiKey-with-OpenPGP)

## Change PIN

```sh-session
$ gpg --change-pin
```

## Manage Yubikey Touch Policy

Show current configuration:

```sh-session
$ ykman openpgp info
```

Change configuration:

```sh-session
$ ykman openpgp keys set-touch sig on
$ ykman openpgp keys set-touch enc on
$ ykman openpgp keys set-touch aut on
$ ykman openpgp keys set-touch att on
```

## Reset Yubikey PGP Applet

```sh-session
$ ykman openpgp reset
```

Reference:
[Resetting the OpenPGP Application on the YubiKey](https://support.yubico.com/hc/en-us/articles/360013761339-Resetting-the-OpenPGP-Applet-on-the-YubiKey)
