# For /nail/scripts/setup_branch
export CTAGS=
export SELENIUM_HOST="$(echo $SSH_CLIENT | cut -d ' ' -f 1)"
export MAKEFLAGS="-j4"

# this is so screen can figure out how to name the title of the open shell
export PS1='\[\033k\033\\\]\u@\h:\w\$ '

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

export PATH=$PATH:/nail/home/alan/scripts
# This is for ropevim
export PYTHONPATH=$PYTHONPATH:/nail/home/alan/py-lib

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi
source ~/.bash_colors
source ~/.bash_prompt
source  ~/bin/git-completion.bash

alias hgrep="history 10000 | grep"
alias pgr="ps -ux | grep"

export VIM=/nail/home/alan/bin/vim
export VIMRUNTIME=/nail/home/alan/.vim
alias vim="/nail/home/alan/bin/vim"
export EDITOR=/nail/home/alan/bin/vim

alias i="PYTHONPATH=~/pg/loc ipython ~/pg/loc/tools/interactive.py"

alias st="git status untracked-files=no"

