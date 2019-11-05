#!/usr/bin/env bash

set -eu

REPO=http://mechatrax.github.io/raspbian/
DIST=buster
DEB=mechatrax-archive-keyring_2016.12.19.2_all.deb
SHA256=3149c46ec82f3b1763537e4c6029923f849f4cd00a08e9b02255b05f4240fcfb
TMPDIR=$(mktemp -d /tmp/io.github.mechatrax.raspbian.${DIST}.setup.XXXXXXX)

pushd $TMPDIR
echo "$SHA256 $DEB" > sha256.txt
wget http://mechatrax.github.io/raspbian/pool/main/m/mechatrax-archive-keyring/$DEB
sha256sum -c sha256.txt
dpkg -i $DEB
popd
rm -rf $TMPDIR

cat << EOF > /etc/apt/sources.list.d/mechatrax.list
deb $REPO $DIST main contrib non-free
# Uncomment line below then 'apt-get update' to enable 'apt-get source'
#deb-src $REPO $DIST main contrib non-free
EOF

apt update
