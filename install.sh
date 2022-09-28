#!/bin/bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

cp "$script_dir/install-dotfiles.sh" ~

mkdir -p ~/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCtd2SeU4ttb65pK58zJNkE7QMI99zCWD0odIbskaxxwtC+NT89E2HaEei+nsNSMKhU3XdANq4X0fjcIhJlkPH/Q+xSyUZ4V6rrbP0H1MuMyBMHyzS7hD4N52wCr3bbgUonRTYSE5pm6bSgRnSJyLt/4ozrl+RLTLoMamllCA2qc/3V54uVN33lPdTYePk5CQxYNZ35uMP66w5upN2UMJEwWYAZNerCAO0hdgU2yzi1lm5tgrsB6kO7MMAPrfAMq4xR+hLvEU7tWDro3F9D8p2wQf+Rsk8elwFWCwNh8oZtqXBbws0dzdUIzDwTtOJtZKUTStWrPssMCpf3lnnADG478xVISuP7k0ZADtn//GCMUV5RSTt83hfEKb1w726Nokd3EW9X0FDFR48rpyrl19vh26vWcfyxo0PodDtWjgKmiue5gRW7k5X/EnYaRQ50CNgDWjkRxvpvohEY5rsTMWzjPiqiFMTxva7GiVIXBZ9uv2KldcYBs6w6jd2exRVqkeW5mR7rWQ8ufJiceaDWIKW3o0mCEKYMHeDQXUaD2pEN6iJ3ALjCJm1AuiF8XjWdTVIWlZqAh9R9A7jzP2pE4rrWD4dzaEGdP8lFoCsQ3o0vCL80lh/6W7cEjjL+/yYMzGji3i7DKrjPQYvguPi7WcxdxGVEfHa1YyYkFsBzQKZOw== danfarino@Dans-MacBook-Pro.local' > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

mkdir -p ~/bin
curl -sSL -o ~/bin/rustgit https://github.com/danfarino/rustgit/releases/download/latest/rustgit
chmod +x ~/bin/rustgit

curl -fsSLO https://github.com/zyedidia/micro/releases/download/v2.0.11/micro-2.0.11-amd64.deb
sudo apt install -y ./micro-2.0.11-amd64.deb
rm micro-2.0.11-amd64.deb

(
    cd ~/.vscode-remote/data/Machine
    jq -M '.["workbench.colorCustomizations"] = { "titleBar.activeBackground": "#d9d0e7" }' < settings.json | sponge settings.json
)
