source  ~/bin/git-completion.bash

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

export MAKEFLAGS="-j4" # this is so screen can figure out how to name the title of the open shell 

export HISTCONTROL=ignoredups:erasedups:ignoreboth  # no duplicate entries 

export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it # Save and reload the history after each command finishes export 
PROMPT_COMMAND="history -a; history -c; history -r;" 
source ~/.bash_colors
source ~/.bash_prompt
