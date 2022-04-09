#!/usr/bin/env zsh

set -eu

echo -e "\n- Installing Xcode Command Line Tools ..."

if [ "$(xcode-select -p 1>/dev/null; echo $?)" != 0 ]; then
    xcode-select --install
fi

echo -e "\n- Finished installing Xcode Command Line Tools!"
