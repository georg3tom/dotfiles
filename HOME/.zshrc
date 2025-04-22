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

alias c='clear';
alias vim='nvim';
alias la='ls -la';
alias ipinfo='curl ipinfo.io/ip'
alias du='du -ch'
alias df='df -h'
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir='mkdir -vp'
alias wgetall='wget -r -np -nH --cut-dirs=3 -R index.html'
alias python='python3'
setopt HIST_SAVE_NO_DUPS
DISABLE_AUTO_TITLE="true"
export EDITOR="nvim"

# catppuccin-frappe
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
# --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
# --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

# rose-pine
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

# export TERM="xterm-256color"
bindkey '^ ' autosuggest-execute
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ $TERM == "xterm-kitty" ]]; then
  # alias ssh="kitty +kitten ssh"
  alias ssh="TERM=xterm-256color; ssh"
  alias mosh="TERM=xterm-256color; mosh"
fi
