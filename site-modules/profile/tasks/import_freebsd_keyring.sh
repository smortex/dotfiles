#!/bin/sh

fetch -o - https://docs.freebsd.org/pgpkeys/pgpkeys.txt | gpg2 --import
