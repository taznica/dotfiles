#!/usr/bin/env zsh

set -eu

echo -e "\n- Installing Homebrew ..."

if ! command -v brew > /dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo -e "\n- Finished installing Homebrew!"

echo -e "\n- Brewing packages and apps ..."

brew bundle

echo -e "\n- Finished Brewing packages and apps!"
