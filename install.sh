#!/bin/bash

# install nvim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar -xvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

sudo mv nvim-linux64 /opt/nvim

line='export PATH="/opt/nvim/bin:$PATH"'
grep -qxF "$line" ~/.bashrc || echo $line >> ~/.bashrc
source ~/.bashrc
# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim


echo "Now run the following commands:"
echo "  source ~/.bashrc"
echo "  nvim ."
echo "  :Ex"
echo "navigate to lua/connoraubry/packer.nvim; press enter"
echo "  :so"
echo "  :PackerSync"
