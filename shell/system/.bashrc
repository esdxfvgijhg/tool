#!/bin/bash

case $- in # If not running interactively, don't do anything
    *i*) ;;
      *) return;;
esac

shopt -s histappend # append to the history file, don't overwrite it
shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s globstar # If set, the pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)" # make less more friendly for non-text input files, see lesspipe(1)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then # set variable identifying the chroot you work in (used in the prompt below)
    debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in # set a fancy prompt (non-color, unless we know we "want" color)
    xterm-color|*-256color) color_prompt=yes;;
esac
force_color_prompt=yes # uncomment for a colored prompt, if the terminal has the capability; turned off by default to not distract the user: the focus in a terminal window should be on the output of commands.
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes 	# We have color support; assume it's compliant with Ecma-48 (ISO/IEC-6429). (Lack of such support is extremely rare, and such a case would tend to support setf rather than setaf.)
    else
	color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
case "$TERM" in # If this is an xterm set the title to user@host:dir
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
if [ -x /usr/bin/dircolors ]; then # enable color support of ls and also add handy aliases
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01' # colored GCC warnings and errors
if ! shopt -oq posix; then # enable programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
############################################################
# Load the functions, aliases and exports
for file in ~/Aghiles/tool/shell/system/{export,functions,alias}; do
[ -r "$file" ] && source "$file"
done
unset file

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_alias
#fi
#if [ -n "$BASH_VERSION" ]; then # if running bash
#    # include .bashrc if it exists
#    if [ -f "$HOME/.config/bash/.bashrc" ]; then
#	. "$HOME/.config/bash/.bashrc"
#    fi
#fi
#if [ -d "$HOME/bin" ] ; then # set PATH so it includes user's private bin if it exists
#    PATH="$HOME/bin:$PATH"
#fi
#[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx # Start graphical server on tty1 if not already running.
#sudo -n loadkeys ~/.local/share/larbs/ttymaps.kmap 2>/dev/null # Switch escape and caps if tty and no passwd required:
