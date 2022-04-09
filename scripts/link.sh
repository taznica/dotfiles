#!/usr/bin/env zsh

set -eu

echo -e "\n- Making symbolic links ..."

DOTPATH="$HOME/dotfiles"

if [ ! -e "$DOTPATH" ]; then
  echo "Error: Directory $DOTPATH does not exist."
  exit 1
fi

cd "$DOTPATH"

for file in .??*; do
  [[ "$file" == ".git" ]] && continue
  [[ "$file" == ".gitignore" ]] && continue
  [[ "$file" == ".DS_Store" ]] && continue
  ln -fvns "$DOTPATH/$file" "$HOME/$file"
done

echo -e "\n- Finished making symbolic links !"
