#!/usr/bin/env bash

set -eu

REPO=http://mechatrax.github.io/raspbian/
DIST=bookworm
DEB=mechatrax-archive-keyring_2023.06.01_all.deb
SHA256=d0cd8a41ce928b7cffbaf24c63772ccb18cb5e320e13bd7e42ca0a43f37c9c17
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
deb [signed-by=$SIGNKEY] $REPO $DIST main contrib non-free non-free-firmware soracom

# Uncomment line below then 'apt-get update' to enable 'apt-get source'
#deb-src [signed-by=$SIGNKEY] $REPO $DIST main contrib non-free non-free-firmware
EOF

apt update
