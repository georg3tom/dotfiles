# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:$HOME/.local/bin:$HOME/.gem/ruby/2.6.0/bin
export PATH=$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin
export PATH=$PATH:$HOME/.yarn/bin:$HOME/.gem/ruby/2.7.0/bin
export LANG=en_IN.UTF-8
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL='alacritty'
# Path to your oh-my-zsh installation.
export ZSH="/home/george/.oh-my-zsh"
setopt HIST_SAVE_NO_DUPS

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
plugins=(git fzf zsh-autosuggestions )
source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_AUTOSUGGEST_STRATEGY=(history)

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias c='clear';
alias vim='nvim';
alias la='ls -la';
# alias gotop='gotop -c monokai -p -s'
alias hotspot='nmcli con up Hotspot ifname wlo1'
alias hotspotd='nmcli con down Hotspot'
alias ipinfo='curl ipinfo.io/ip'
alias du='du -ch'
alias df='df -h'
alias i="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir='mkdir -vp'
alias wgetall='wget -r -np -nH --cut-dirs=3 -R index.html'

urls()
{
    curl -s "https://tinyurl.com/api-create.php?url=$1"
}

fzf-vim-widget() {
    FFILE=$(fd --type f -c never| fzf --preview="cat {}" --preview-window=right:70%:wrap --height 40%)
    zle reset-prompt
    if [[ ! -z $FFILE ]]
    then
        $EDITOR $FFILE
    fi
    unset FFILE
}
zle     -N   fzf-vim-widget
bindkey '^p' fzf-vim-widget

bindkey '^ ' autosuggest-execute

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B

'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.config/zsh/pure2.zsh ]] || source ~/.config/zsh/pure2.zsh

source ~/.config/nnn/nnn.sh
source ~/.config/zsh/notes.zsh
