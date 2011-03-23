# For /nail/scripts/setup_branch 
export CTAGS= 
export MAKEFLAGS="-j4" # this is so screen can figure out how to name the title of the open shell 
#export PS1='\[\033k\033\\\]\u@\h:\w\$ ' 

export HISTCONTROL=ignoredups:erasedups:ignoreboth  # no duplicate entries 

export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it # Save and reload the history after each command finishes export 
PROMPT_COMMAND="history -a; history -c; history -r;" 
#export PATH=$PATH:/nail/home/alan/scripts # enable color support of ls and also add handy aliases
source ~/.bash_colors
source ~/.bash_prompt
alias hgrep="history 10000 | grep"
alias pgr="ps -ux | grep"
alias st="git status untracked-files=no"

