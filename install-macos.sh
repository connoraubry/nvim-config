#!/bin/bash
set -euxo pipefail

TARGET_SHELL_RC="~/.bashrc"
if [[ -n "ZSH_VERSION" ]]; then
    TARGET_SHELL_RC="~/.zshrc"
fi

# install nvim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz
tar -xvf nvim-macos.tar.gz
rm nvim-macos.tar.gz

if [[ "$EUID" -eq 0 ]]; then
    #if root
    mv nvim-linux64 /opt/nvim
else
    sudo mv nvim-linux64 /opt/nvim
fi

line='export PATH="/opt/nvim/bin:$PATH"'
grep -qxF "$line" $TARGET_SHELL_RC || echo $line >> $TARGET_SHELL_RC

line='alias vim="nvim"'
grep -qxF "$line" $TARGET_SHELL_RC || echo $line >> $TARGET_SHELL_RC

source $TARGET_SHELL_RC
