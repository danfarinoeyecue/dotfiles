#!/bin/bash

set -euo pipefail

read -r -s -p "GitHub token: " token
echo
cd
rm .gitconfig
git clone "https://oauth2:$token@github.com/danfarino/dotfiles.git"
./dotfiles/setup.sh
