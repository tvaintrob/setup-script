#!/bin/bash

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating homebrew..."
brew update

echo "Git config"
echo "Full Name: "
read user_name

echo "Email: "
read email

git config --global user.name $user_name
git config --global user.email $email

# installing cli tools
tools=(
    z
    jq
    bat
    fzf
    zsh
    pipx
    asdf
    tmux
    wget
    helm
    tree
    htop
    docker
    httpie
    neovim
    kubectx
    lazygit
    ripgrep
    thefuck
    coreutils
    kubernetes-cli
    reattach-to-user-namespace
)

brew install ${tools[@]}
brew cleanup


# installing casks
casks=(
    vlc
    alfred
    docker
    iterm2
    postman
    whatsapp
    rectangle
    brave-browser
)

brew install ${casks[@]}
brew cleanup

# setup mac options
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# Expanding the save panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Disabling press-and-hold for keys in favor of a key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Showing all filename extensions in Finder by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disabling the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoiding the creation of .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

killall Finder

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Please restart your shell and make sure Oh-My-Zsh is setup, before running ./setup-post-zsh.sh"
read
