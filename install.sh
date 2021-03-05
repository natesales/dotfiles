#!/bin/bash

USER="nate"

sudo apt update
sudo apt install -y git curl zsh

# ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

# Symlinks
ln -s /home/nate/Projects/dotfiles/.zshrc /home/nate/.zshrc
