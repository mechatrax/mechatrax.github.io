#!/usr/bin/env bash

set -eu

REPO=http://mechatrax.github.io/raspbian/
DIST=bullseye
DEB=mechatrax-archive-keyring_2016.12.19.4+deb11u2_all.deb
SHA256=127859815a8ee0c381f1d67143df324e500e9b74dd56f3a20b245b9cdfae7e24
TMPDIR=$(mktemp -d /tmp/io.github.mechatrax.raspbian.${DIST}.setup.XXXXXXX)
SIGNKEY=/usr/share/keyrings/mechatrax-archive-keyring.gpg

pushd $TMPDIR
echo "$SHA256 $DEB" > sha256.txt
wget http://mechatrax.github.io/raspbian/pool/main/m/mechatrax-archive-keyring/$DEB
sha256sum -c sha256.txt
dpkg -i $DEB
popd
rm -rf $TMPDIR

cat << EOF > /etc/apt/sources.list.d/mechatrax.list
deb [signed-by=$SIGNKEY] $REPO $DIST main soracom
# Uncomment line below then 'apt-get update' to enable 'apt-get source'
#deb-src [signed-by=$SIGNKEY] $REPO $DIST main
EOF

apt update
