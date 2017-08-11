# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH


export HISTCONTROL=ignoredups
export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTFILESIZE=99999

HISTIGNORE="&:pwd:ls:exit"
HISTTIMEFORMAT="%Y%m%d-%T "
shopt -s cmdhist
shopt -s histappend


red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
yellow=$(tput setaf 6)
cyan=$(tput setaf 3)
white=$(tput setaf 7)

reset=$(tput sgr0)

if [ -t 0 ] ; then
         # Display in bold
         [ -x /usr/bin/tput ] && /usr/bin/tput bold
         # Display in inverse colors
         # [ -x /usr/bin/tput ] && /usr/bin/tput rev
         [ -x /usr/bin/tput ] && /usr/bin/tput sgr0
fi

PS1="\[$red\]\u\[$reset\]@\[$green\]\h\[$reset\]:\[$cyan\]\W\[$reset\]\$ "


export TMOUT=0

# Git options
export GIT_PAGER=more

pkill -u patelkay ssh-agent

SSH_AGENT_CACHE=`ssh-agent -s 2>/dev/null`
bash -c "eval '$SSH_AGENT_CACHE' > /dev/null;
        if [ -n \"\`ps -p \$SSH_AGENT_PID 2>/dev/null | fgrep ssh-agent 2>&1 /dev/null \`\" ]
        then exit 0 ;
        else exit 1
        fi"
rc=$?
if [ $rc ]
then
        eval $SSH_AGENT_CACHE
else
        echo "ssh-agent could not be started."
fi
#
#

[ -f ~/.ssh/id_rsa ] && ssh-add ~/.ssh/id_rsa





