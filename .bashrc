# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

while=$(tput setaf 15);
orange=$(tput setaf 208);
green=$(tput setaf 120);
red=$(tput setaf 160);
default=$(tput sgr0);

PS1="[\[${green}\]\W\[${default}\]]\$ ";
#PS1="\[${red}\][\W]> \[$(tput setaf 15)\]";
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias c='clear';
alias la='ls -la';
alias gotop='gotop -c monokai'
alias vim='nvim'

[ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'
