#!/bin/bash

set -eu

. /etc/os-release
curl -fsSL https://mechatrax.github.io/setup/${VERSION_CODENAME}.sh | bash
