alias vim='nvim'
alias vimrc='vim ~/.config/nvim/init.lua'
alias ls='ls --group-directories-first --color=always'
alias lg='lazygit'
alias lz='lazygit'
alias gcoo='git checkout `git branch --format="%(refname:short)" | fzf --preview="git log {} --color=always"`'
alias kc="kubectl"
alias pods="kubectl get pods"
alias svc="kubectl get svc"

alias tf="terraform"

# source $HOME/code/scripts/install.sh
