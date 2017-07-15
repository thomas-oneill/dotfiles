#!/bin/bash
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
case $SHELL in
*/sh)
  ;;
*/zsh)
  ;;
*/bash)
  for file in ~/.{aliases,bash_prompt,exports,functions,path,secrc,gcloudrc}; do
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
  done
  unset file
esac

source <(kubectl completion bash)

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Disable completion when the input buffer is empty.  i.e. Hitting tab
# and waiting a long time for bash to expand all of $PATH.
shopt -s no_empty_cmd_completion

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob
# Enable history appending instead of overwriting when exiting.  #139609
shopt -s histappend

HISTSIZE=10000000
HISTFILESIZE=20000000
PROMPT_COMMAND='history -a'
HISTCONTROL=ignoreboth:erasedups

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config
# ignoring wildcards
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" \
	-o "nospace" \
	-W "$(grep "^Host" ~/.ssh/config | \
	grep -v "[?*]" | cut -d " " -f2 | \
	tr ' ' '\n')" scp sftp ssh

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.
# We run dircolors directly due to its changes in file syntax and
# terminal name patching.
use_color=false
if type -P dircolors >/dev/null ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	LS_COLORS=
	if [[ -f ~/.dir_colors ]] ; then
		eval "$(dircolors -b ~/.dir_colors)"
	elif [[ -f /etc/DIR_COLORS ]] ; then
		eval "$(dircolors -b /etc/DIR_COLORS)"
	else
		eval "$(dircolors -b)"
	fi
	# Note: We always evaluate the LS_COLORS setting even when it's the
	# default.  If it isn't set, then `ls` will only colorize by default
	# based on file attributes and ignore extensions (even the compiled
	# in defaults of dircolors). #583814
	if [[ -n ${LS_COLORS:+set} ]] ; then
		use_color=true
	else
		# Delete it if it's empty as it's useless in that case.
		unset LS_COLORS
	fi
elif [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
	# Some systems (e.g. BSD & embedded) don't typically come with
	# dircolors so we need to hardcode some terminals in here.
	export CLICOLOR=1
	export LSCOLORS=GxFxCxDxBxegedabagaced
	use_color=true;
else
	case ${TERM} in
	[aEkx]term*|rxvt*|gnome*|konsole*|screen|cons25|*color) use_color=true;;
	esac
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color sh

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [[ -d /usr/share/bash-completion ]] && [[ -f /usr/share/bash-completion/bash_completion ]]; then
        # shellcheck source=/dev/null
        . /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]]; then
        # shellcheck source=/dev/null
        . /etc/bash_completion
    fi
    if [[ -d /etc/bash_completion.d ]]; then
        for file in /etc/bash_completion.d/* ; do
            # shellcheck source=/dev/null
            source "$file"
        done
    fi
fi
