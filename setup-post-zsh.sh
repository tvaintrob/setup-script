#!/bin/bash

echo "Please make sure asdf plugin for oh-my-zsh is loaded"
echo "ZSH_PLUGINS=(... asdf ...)"
read

# installing languages
asdf plugin add java
asdf plugin add python
asdf plugin add nodejs

asdf install java latest
NODEJS_CHECK_SIGNATURES=no asdf install nodejs lts

# fixing python install for mac
brew install bzip2 lbzip2 lzlib openssl zlib

export LDFLAGS="-L/usr/local/opt/bzip2/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/openssl@1.1/lib"
export CFLAGS="-I/usr/local/opt/bzip2/include -I/usr/local/opt/zlib/include -I/usr/local/opt/openssl@1.1/include -I$(xcrun --show-sdk-path)/usr/include -Wno-implicit-function-declaration" 
asdf install python 3.6.13
asdf install python latest

asdf global java latest
asdf global python latest 3.6.13 system
asdf global nodejs lts

pipx ensurepath
