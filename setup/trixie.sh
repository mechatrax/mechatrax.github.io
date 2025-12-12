#!/bin/bash

set -eu

REPO="http://mechatrax.github.io/raspbian/"
DIST="trixie"
SOURCE_DIR="/etc/apt/sources.list.d"
PREFIX="mechatrax"
SOURCE_FILE="${SOURCE_DIR}/${PREFIX}.sources"

SIGNKEY='-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEZHgt7hYJKwYBBAHaRw8BAQdAEUiE3FxXVU3s1lMaCkOYi5IjKYN8XUU9DQ8T
XtJRIbW0Sk1lY2hhVHJhY2tzIENvLiwgTHRkLiAoTWVjaGF0cmF4IEFyY2hpdmUg
U2lnbmluZyBLZXkpIDxpbmZvQG1lY2hhdHJheC5jb20+iJAEExYIADgWIQS3SfsI
gf5OQUB4t27Vk0v6ESUIOQUCZHgt7gIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIX
gAAKCRDVk0v6ESUIOTxJAQCA7wW3ZUuQOZIevI96buyraAIKPKpaFB/6WUxqvR6d
ZgEAnHsJhzu+nm1JIldPfy42TNQU7AZJHDrhD2m1mG1zRwQ=
=a674
-----END PGP PUBLIC KEY BLOCK-----'

cat << EOF > "$SOURCE_FILE" 
Types: deb
URIs: $REPO
Suites: ${DIST}
Components: main soracom
Signed-By:
$(echo "$SIGNKEY" | sed -e 's/^$/./' -e 's/^/  /')

Enabled: no
Types: deb-src
URIs: $REPO
Suites: ${DIST}
Components: main
Signed-By:
$(echo "$SIGNKEY" | sed -e 's/^$/./' -e 's/^/  /')
EOF

apt update
