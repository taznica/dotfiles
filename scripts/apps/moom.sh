#!/usr/bin/env zsh

set -eu

echo -e "\n- Configuring Moom ..."

DOTPATH=$HOME/dotfiles

rm "$HOME/Library/Preferences/com.manytricks.Moom.plist"
ln -fhvs "$DOTPATH/.config/apps/com.manytricks.Moom.plist" "$HOME/Library/Preferences/com.manytricks.Moom.plist"

echo -e "\n- Finished configuring Moom !"
echo "Need to restart PC to reload settings."
echo "Need to configure some settings manually."
