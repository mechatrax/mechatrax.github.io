#!/usr/bin/env bash

set -eu

REPO=http://mechatrax.github.io/raspbian/
DIST=bullseye
DEB=mechatrax-archive-keyring_2016.12.19.4+deb11u1_all.deb
SHA256=d77958d3e1b4af502264a8ca70966aea271450b1b9cf18883c667fc2d6db2f11
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
