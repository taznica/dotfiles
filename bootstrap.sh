#!/usr/bin/env zsh

set -eu

echo -e "\n- Starting bootstrapping ..."
DOTPATH=$HOME/dotfiles

echo -e "\n- Downloading dotfiles and scripts into ${DOTPATH} ..."

if [ ! -d "$DOTPATH" ]; then
    git clone https://github.com/taznica/dotfiles.git "$DOTPATH"
else
    echo "$DOTPATH already downloaded. Updating..."
    cd "$DOTPATH"
    git stash
    git checkout main
    git pull origin main
    echo
fi

cd "$DOTPATH"

echo -e "\n- Finished Downloading dotfiles and scripts!"

# Create symbolic links of dotfiles in home directory (~)
./scripts/link.sh 

# Install Xcode Command Line Tools
./scripts/xcode.sh

# Install Homebrew, and brew packages and apps
./scripts/homebrew.sh

# Configure anyenv and nodenv
./scripts/anyenv.sh 

# Configure macOS
./scripts/macos.sh 

# Configure apps
for script in "./scripts/apps"; do
    script
done

echo -e "\n- Finished bootstrapping !"
