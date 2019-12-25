export TERMINAL="termite"
export FILE="ranger"
export EDITOR="nvim"
export READER="zathura"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export BROWSER="$HOME/.config/Scripts/linkhandler"
export TRUEBROWSER="qutebrowser"
export ALTBROWSER="firefox"

export I3BLOCKS_LAYOUT="pkill -SIGRTMIN+10 i3blocks"
export I3BLOCKS_VOLUME="pkill -SIGRTMIN+11 i3blocks"
export I3BLOCKS_POWERSAVER="pkill -SIGRTMIN+12 i3blocks"
export I3BLOCKS_MAIL="pkill -SIGRTMIN+13 i3blocks"

PATH="$PATH:$HOME/.config/Scripts/:$HOME/.gem/ruby/2.5.0/bin:$HOME/go/bin:$HOME/.local/bin"

export DEFAULT_USER="micah"
export LC_ALL=en_US.UTF-8
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export XDG_CONFIG_HOME="$HOME/.config"
export TEXINPUTS=".:$HOME/Documents/LaTeX/styles:"

# set up go environment variables
export GOPATH="/home/micah/go"
export GOBIN="$GOPATH/bin"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
