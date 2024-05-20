# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"  
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias v="nvim"
alias python="$(pyenv which python)"
alias pip="$(pyenv which pip)"
alias i="python -m IPython"
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
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Vi-mode
# source ~/antigen.zsh
# antigen bundle jeffreytse/zsh-vi-mode
# antigen bundle pip
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen apply

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
  macos
  python
  z
)

source $ZSH/oh-my-zsh.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=$(pyenv root)/shims:$PATH

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/edibegovic/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/edibegovic/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/edibegovic/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/edibegovic/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

