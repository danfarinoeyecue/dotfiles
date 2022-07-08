#!/bin/bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

cp "$script_dir/install-dotfiles.sh" ~
