#!/usr/bin/env bash

set -eu

REPO=http://mechatrax.github.io/raspbian/
DIST=bullseye
DEB=mechatrax-archive-keyring_2016.12.19.4_all.deb
SHA256=3f4cc6ac5cb3e69c7599cb51b9519bb013fda261b5de4f0278e100dbc4586955
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
deb [signed-by=$SIGNKEY] $REPO $DIST main contrib non-free soracom
# Uncomment line below then 'apt-get update' to enable 'apt-get source'
#deb-src [signed-by=$SIGNKEY] $REPO $DIST main contrib non-free
EOF

apt update
