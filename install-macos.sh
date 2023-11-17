#!/bin/zsh
set -e
# install nvim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz
tar -xvf nvim-macos.tar.gz
rm nvim-macos.tar.gz

sudo mv nvim-macos /opt/nvim

line='export PATH="/opt/nvim/bin:$PATH"'
grep -qxF "$line" ~/.zshrc || echo $line >> ~/.zshrc
source ~/.zshrc
# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim


echo "Now run the following commands:"
echo "  source ~/.bashrc"
echo "  nvim ."
echo "  :Ex"
echo "navigate to lua/connoraubry/packer.nvim; press enter"
echo "  :so"
echo "  :PackerSync"
