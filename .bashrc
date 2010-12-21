# For /nail/scripts/setup_branch
export CTAGS=
export SELENIUM_HOST="$(echo $SSH_CLIENT | cut -d ' ' -f 1)"
export MAKEFLAGS="-j4"

# this is so screen can figure out how to name the title of the open shell
export PS1='\[\033k\033\\\]\u@\h:\w\$ '

export HISTCONTROL=ignoredups:erasedups:ignoreboth  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r;"

export PATH=$PATH:/nail/home/alan/scripts

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

