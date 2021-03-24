#!/bin/zsh

# ---- DIR CONFIG ----
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
[ -d $ZSH_CACHE_DIR ] || mkdir -p $ZSH_CACHE_DIR
export XDG_CONFIG_HOME="$HOME/.config"
#export ZCONF=$XDG_CONFIG_HOME/aetherwolf/zsh # path to zsh config

# ---- MACOS ----
if [[ "$OSTYPE" == "darwin"* ]]; then # homebrew configs for macos
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/usr/local/opt/sqlite/bin:$PATH"
  #export M2_REPO="~/.m2"
fi

# ---- GENERAL ----
export BLOCKSIZE=1k # set default blocksize for ls, df, du

# ---- HISTORY ----
HISTFILE="ZSH_CACHE_DIR/.zsh_history"
HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
#setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
#setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
# setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
# setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# ---- AUTOCOMPLETE ----

#setopt MENU_COMPLETE

# ---- INPUT ----

# reduce vim timeouts
# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
KEYTIMEOUT=1 # 10ms for key sequences
#bindkey -v # use vim keybinds

# PS1+='${VIMODE}'
# #   '$' for normal insert mode
# #   a big red 'I' for command mode - to me this is 'NOT insert' because red
# function zle-line-init zle-keymap-select {
#     DOLLAR='%B%F{green}$%f%b '
#     GIANT_I='%B%F{red}I%f%b '
#     VIMODE="${${KEYMAP/vicmd/$GIANT_I}/(main|viins)/$DOLLAR}"
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# ---- LOCALE ----
# (used by perl, ruby etc)
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ---- APPS ----
export ENHANCD_FILTER=fzy;

# ---- RUBY ----
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# ---- SSH KEYS ----
# load ssh key for github etc (only if not already loaded)
# http://unix.stackexchange.com/questions/132791/have-ssh-add-be-quiet-if-key-already-there
if [ -f ~/.ssh/id_rsa ]; then
    aw_msg "loading ~/.ssh/id_rsa"
    ssh-add -l | grep -q `ssh-keygen -lf ~/.ssh/id_rsa | awk '{print $2}'` || ssh-add ~/.ssh/id_rsa
fi