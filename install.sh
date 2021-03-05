#!/bin/bash

sudo apt update
sudo apt install -y git curl zsh

# ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

