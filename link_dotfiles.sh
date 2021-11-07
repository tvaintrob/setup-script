#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# link neovim config
ln -s "$SCRIPTPATH/neovim" $HOME/.config/nvim

# link ZSH config
ln -s "$SCRIPTPATH/zsh/zshrc" $HOME/.zshrc
ln -s "$SCRIPTPATH/zsh/*.zsh" $ZSH_CUSTOM

# link tmux config
ln -s "$SCRIPTPATH/tmux/tmux.conf" $HOME/.tmux.conf
