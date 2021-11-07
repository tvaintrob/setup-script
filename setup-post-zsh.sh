#!/bin/bash

echo "Please make sure asdf plugin for oh-my-zsh is loaded"
echo "ZSH_PLUGINS=(... asdf ...)"
read

# installing languages
asdf plugin add java
asdf plugin add python
asdf plugin add nodejs

asdf install java latest
asdf install python latest
NODEJS_CHECK_SIGNATURES=no asdf install nodejs latest

asdf global java latest
asdf global python latest
asdf global nodejs latest

pipx ensurepath
