#!/usr/bin/env bash

# The point of this script is to copy the current config on this machine into the neovimrc
# repo. This way if I edit configuration somewhere on my machine, I can easy update my repo
# and push to git!

cd "$(dirname ${BASH_SOURCE[0]})"
cd "$(git rev-parse --show-toplevel)"

# $1 - The path to a directory being updated from on the machine.
# $2 - The relative path from the top of this repo to what to overwrite!
try_update() {
    if [ -d "$1" ]; then
        rm -rf $2
        cp -r $1 $2
    fi
}

local_nvim="${HOME}/.config/nvim"
repo_nvim="./nvim"

set -x
try_update "/etc/nixos" "./nixos"
try_update "${HOME}/.config/nvim" "./nvim"
try_update "${HOME}/.config/tmux" "./tmux"



