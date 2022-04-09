#!/usr/bin/env zsh

set -eu

echo -e "\n- Configuring anyenv ..."

# export ANYENV_DEFINITION_ROOT=${HOME}/.anyenv/anyenv-install (set in .zshrc)
anyenv install --init
# Manifest directory doesn't exist: /Users/taznica/.anyenv/anyenv-install
# Do you want to checkout https://github.com/anyenv/anyenv-install.git? [y/N]: y

echo -e "\n- Finished configuring anyenv!"

echo -e "\n- Installing nodenv ..."

anyenv install nodenv
#exec $SHELL -l
#nodenv install -l

echo -e "\n- Finished installing nodenv!"
echo "(Install Node.js: $ nodenv install -l)"
