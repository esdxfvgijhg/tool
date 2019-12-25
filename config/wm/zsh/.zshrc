# set up antigen plugin manager
if which antibody >/dev/null; then
  source <(antibody init)
  antibody bundle https://github.com/denysdovhan/spaceship-prompt
  antibody bundle https://github.com/zsh-users/zsh-autosuggestions
  antibody bundle https://github.com/zsh-users/zsh-syntax-highlighting
fi

# set up prompt
export SPACESHIP_TIME_SHOW='true'
export SPACESHIP_DIR_PREFIX=''
export SPACESHIP_CHAR_SYMBOL='➤'
export SPACESHIP_CHAR_SUFFIX=' '
export SPACESHIP_EXEC_TIME_PREFIX=''
export SPACESHIP_GIT_PREFIX=''
export SPACESHIP_VI_MODE_INSERT='[I]'
export SPACESHIP_VI_MODE_NORMAL='[N]'
export SPACESHIP_VI_MODE_SUFFIX=' '
export SPACESHIP_VI_MODE_COLOR=$SPACESHIP_CHAR_COLOR_SUCCESS

export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=10000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

setopt INTERACTIVECOMMENTS
setopt CORRECT

# completions
fpath=($HOME/.config/Scripts/zsh-completions $fpath)
autoload -U compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# terminal vim
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}
zle -N zle-keymap-select

bindkey -v
export KEYTIMEOUT=10
bindkey -M viins 'fj' vi-cmd-mode
bindkey -M viins 'jf' vi-cmd-mode
bindkey -M viins '^a' vi-beginning-of-line
bindkey -M viins '^e' vi-end-of-line
bindkey -M viins '^k' kill-line
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
bindkey "^?" backward-delete-char

# edit command in vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey '^ ' autosuggest-accept

[ -f $HOME/.zsh_aliases ] && source $HOME/.zsh_aliases

[ -f $HOME/.zsh_localaliases ] && source $HOME/.zsh_localaliases

[ -f $HOME/.zsh_shortcuts ] && source $HOME/.zsh_shortcuts

# enable fzf
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f $HOME/.config/Scripts/pins ] && source pins

[ -f $HOME/.config/Scripts/tasks ] && source tasks

[ -f $HOME/.config/wpg/sequences ] && (cat $HOME/.config/wpg/sequences &)

#neofetch
#if [ $(t|wc -l) -gt 0 ]; then
#  echo "Tasks:"
#  echo "$(t)"
#  echo ""
#fi

compinit
