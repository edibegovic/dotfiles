#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias v="nvim"
alias i="IPython"
alias w="curl wttr.in"
alias c="clear"
alias pb="pbcopy"
alias st="tmux source-file ~/.tmux.conf"
alias sed="gsed"
alias jn="jupyter notebook"
alias jl="jupyter lab"
alias s="source ~/.zshrc"
alias h="howdoi"
alias o="open ."

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Vi-mode
# set -o
# bindkey -v

# Only auto-complete paths
zstyle :completion::complete:-command-:: tag-order local-directories -
zstyle ':completion:*' insert-tab false

# Homebrew no update every time :) 
# export HOMEBREW_NO_AUTO_UPDATE=1

# Path oh-my-zsh installation.
export ZSH="/Users/edibegovic/.oh-my-zsh"

export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND='rg --files'

# Install (one or multiple) selected applications
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]lugin
bip() {
  local inst=$(brew search | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; brew install $prog; done;
  fi
}

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  osx
  python
)

PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[green]%}Location: %~%{$reset_color%}$(git_prompt_info) '

source $ZSH/oh-my-zsh.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias python=/usr/local/bin/python3.7
