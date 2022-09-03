#!/bin/bash

set -euo pipefail

unset GITHUB_TOKEN
read -r -s -p "GitHub token: " token
echo
echo "$token" | gh auth login --git-protocol https --with-token
gh auth setup-git
cd
gh repo clone danfarino/dotfiles
rm .gitconfig
./dotfiles/setup.sh
