#!/usr/bin/zsh
# Profile file. Runs on login. Environmental variables are set here.
if [ -d "$HOME/.zshenv.d" ]; then
	for EXTENSION_FILE in $(find $HOME/.zshenv.d/ -name '*.zsh'); do
		source "$EXTENSION_FILE"
	done
fi
# if running bash
if [ -n "$BASH_VERSION" ]; then
		# include .bashrc if it exists
		if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
		fi
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
		PATH="$HOME/bin:$PATH"
fi
#mpd >/dev/null 2>&1 &
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
# /etc/motd
if [ -e /etc/motd ]; then
	if ! cmp -s $HOME/.hushlogin /etc/motd; then
		tee $HOME/.hushlogin < /etc/motd
	fi
fi
# Use "cbt" capability ("back_tab", as per `man terminfo`), if we have it:
if tput cbt &> /dev/null; then
	bindkey "$(tput cbt)" reverse-menu-complete # make Shift-tab go to previous completion
fi
# set up antigen plugin manager
if which antibody >/dev/null; then
	source <(antibody init)
	antibody bundle https://github.com/denysdovhan/spaceship-prompt
	antibody bundle https://github.com/zsh-users/zsh-autosuggestions
	antibody bundle https://github.com/zsh-users/zsh-syntax-highlighting
fi
# Load the functions, aliases and exports
for file in ~/Aghiles/tool/shell/zsh/{export,functions,alias,zsh-functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

## enable fzf
#[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
#[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source some zsh plugins
#source $HOME/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source $HOME/dotfiles/zsh/zsh-completions/zsh-completions.plugin.zsh
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh #zplug "githubuser/reponame"
#test -e "$CHRUBY/chruby.sh" && source "$CHRUBY/chruby.sh"
#test -e "$CHRUBY/auto.sh" && source "$CHRUBY/auto.sh"
#test -e "$HOME/.zsh/skim/shell/key-bindings.zsh" && source "$HOME/.zsh/skim/shell/key-bindings.zsh" # Skim
#test -e "$HOME/.zsh/skim/shell/completion.zsh" && source "$HOME/.zsh/skim/shell/completion.zsh"




unsetopt flowcontrol
unsetopt menu_complete # do not autoselect the first completion entry
setopt PROMPT_SUBST
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INTERACTIVECOMMENTS
setopt CORRECT
setopt auto_menu # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt long_list_jobs
setopt AUTO_CD								 # [default] .. is shortcut for cd .. (etc)
setopt AUTO_PARAM_SLASH				# tab completing directory appends a slash
setopt AUTO_PUSHD				# [default] cd automatically pushes old dir onto dir stack
setopt AUTO_RESUME						 # allow simple commands to resume backgrounded jobs
setopt CLOBBER								 # allow clobbering with >, no need to use >!
setopt CORRECT								 # [default] command auto-correction
setopt CORRECT_ALL						 # [default] argument auto-correction
setopt NO_FLOW_CONTROL				 # disable start (C-s) and stop (C-q) characters
setopt NO_HIST_IGNORE_ALL_DUPS # don't filter duplicates from history
setopt NO_HIST_IGNORE_DUPS		 # don't filter contiguous duplicates from history
setopt HIST_FIND_NO_DUPS			 # don't show dupes when searching
setopt HIST_IGNORE_SPACE		# [default] don't record commands starting with a space
setopt HIST_VERIFY						 # confirm history expansion (!$, !!, !foo)
setopt IGNORE_EOF							# [default] prevent accidental C-d from exiting shell
setopt INTERACTIVE_COMMENTS		# [default] allow comments, even in interactive shells
setopt LIST_PACKED						 # make completion lists more densely packed
setopt MENU_COMPLETE					 # auto-insert first possible ambiguous completion
setopt NO_NOMATCH							# [default] unmatched patterns are left unchanged
setopt PRINT_EXIT_VALUE				# [default] for non-zero exit status
setopt PUSHD_IGNORE_DUPS			 # don't push multiple copies of same dir onto stack
setopt PUSHD_SILENT						# [default] don't print dir stack after pushing/popping
setopt SHARE_HISTORY					 # share history across shells


# autocomplete for the git alias
#compdef g=git
#compdef gf=git-flow
# case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Make completion:
# - Try exact (case-sensitive) match first.
# - Then fall back to case-insensitive.
# - Accept abbreviations after . or _ or - (ie. f.b -> foo.bar).
# - Substring complete (ie. bar -> foobar).
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}' '+m:{_-}={-_}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Colorize completions using default `ls` colors.
zstyle ':completion:*' list-colors ''
# Allow completion of ..<Tab> to ../ and beyond.
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(..) ]] && reply=(..)'
# $CDPATH is overpowered (can allow us to jump to 100s of directories) so tends
# to dominate completion; exclude path-directories from the tag-order so that
# they will only be used as a fallback if no completions are found.
zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories'
# Categorize completion suggestions with headings:
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %F{default}%B%{$__WINCENT[ITALIC_ON]%}--- %d ---%{$__WINCENT[ITALIC_OFF]%}%b%f
# Enable keyboard navigation of completions in menu
# (not just tab/shift-tab but cursor keys as well):
zstyle ':completion:*' menu select
#zstyle ':vcs_info:*' enable git hg
#zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' disable-patterns "${(b)HOME}/code/portal(|-ee)(|/*)"
zstyle ':vcs_info:*' stagedstr "%F{green}●%f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{red}●%f" # default 'U'
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*:*' formats '[%b%m%c%u] ' # default ' (%s)-[%b]%c%u-'
zstyle ':vcs_info:git*:*' actionformats '[%b|%a%m%c%u] ' # default ' (%s)-[%b|%a]%c%u-'
zstyle ':vcs_info:hg*:*' formats '[%m%b] '
zstyle ':vcs_info:hg*:*' actionformats '[%b|%a%m] '
zstyle ':vcs_info:hg*:*' branchformat '%b'
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-revision true
zstyle ':vcs_info:hg*:*' get-mq false
zstyle ':vcs_info:hg*+gen-hg-bookmark-string:*' hooks hg-bookmarks
zstyle ':vcs_info:hg*+set-message:*' hooks hg-message
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
# enable menu-style completion for cdr
zstyle ':completion:*:*:cdr:*:*' menu selection
# fall through to cd if cdr is passed a non-recent dir as an argument
zstyle ':chpwd:*' recent-dirs-default true


bindkey -e # emacs bindings, set to -v for vi bindings
bindkey '^Z' fg-bg
bindkey '^Z' fancy-ctrl-z
bindkey -v
bindkey -M viins 'fj' vi-cmd-mode
bindkey -M viins 'jf' vi-cmd-mode
bindkey -M viins '^a' vi-beginning-of-line
bindkey -M viins '^e' vi-end-of-line
bindkey -M viins '^k' kill-line
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
bindkey "^?" backward-delete-char
bindkey '^x^e' edit-command-line
bindkey '^ ' autosuggest-accept
bindkey "\e[A" history-beginning-search-backward-end	# cursor up
bindkey "\e[B" history-beginning-search-forward-end	 # cursor down
bindkey '^x^x' edit-command-line
bindkey ' ' magic-space # do history expansion on space
# Replace standard history-incremental-search-{backward,forward} bindings.
# These are the same but permit patterns (eg. a*b) to be used.
bindkey "^r" history-incremental-pattern-search-backward
bindkey "^s" history-incremental-pattern-search-forward


autoload -U compinit
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook # adds `cdr` command for navigating to recent directories
autoload -U compinit
autoload -U add-zsh-hook
autoload history-search-end
autoload -U colors
autoload -Uz vcs_info # http://zsh.sourceforge.net/Doc/Release/User-Contributions.html
autoload -U promptinit; promptinit # a nice prompt, install it via npm 
autoload -U compinit && compinit -C
autoload bashcompinit && bashcompinit
autoload -Uz edit-command-line # edit command in vim
autoload -U select-word-style
autoload -U edit-command-line
autoload -U url-quote-magic


zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
zle -N edit-command-line
zle -N fg-bg
zle -N zle-keymap-select
zle -N edit-command-line
zle -N fancy-ctrl-z # easy vim/terminal switch
zle -N self-insert url-quote-magic # smart urls


add-zsh-hook precmd -update-window-title-precmd
add-zsh-hook preexec -update-window-title-preexec
add-zsh-hook preexec -record-start-time
add-zsh-hook precmd -report-start-time
add-zsh-hook precmd bounce
add-zsh-hook chpwd -auto-ls-after-cd
add-zsh-hook preexec -record-command
add-zsh-hook precmd -maybe-show-vcs-info
add-zsh-hook chpwd chpwd_recent_dirs


# Create a hash table for globally stashing variables without polluting main scope with a bunch of identifiers.
typeset -A __WINCENT
typeset -F SECONDS
__WINCENT[ITALIC_ON]=$'\e[3m'
__WINCENT[ITALIC_OFF]=$'\e[23m'



select-word-style bash # only alphanumeric chars are considered WORDCHARS


colors
compinit
compinit -u

