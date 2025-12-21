# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
setopt HIST_SAVE_NO_DUPS
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=( fzf zsh-autosuggestions )
source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_STRATEGY=(history)

alias vim='nvim';
alias la='ls -la';
alias ipinfo='curl ipinfo.io/ip'
alias du='du -ch'
alias df='df -h'
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir='mkdir -vp'
alias wgetall='wget -r -np -nH --cut-dirs=3 -R index.html'
setopt HIST_SAVE_NO_DUPS
export EDITOR="nvim"


bindkey '^ ' autosuggest-execute
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
