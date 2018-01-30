#!/bin/zsh

#-- zsh-history-substring-search
bindkey '^[[A' history-substring-search-up # up key to search up
bindkey '^[[B' history-substring-search-down # down key to search down

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

#-- zsh-autosuggestions
bindkey '^[[1;5C' forward-word # ctrl-right accepts next word in cmd suggestion
bindkey '^[[1;5D' backward-word # ctrl-left moves back one word

##-- vim mode
#bindkey -v
#
#bindkey -M viins 'jk' vi-cmd-mode
#bindkey -M viins '^k' kill-line
#
#bindkey '^P' up-history
#bindkey '^N' down-history
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word
#bindkey '^r' history-incremental-search-backward
#
#autoload -U select-bracketed select-quoted
#zle -N select-bracketed
#zle -N select-quoted
#  for km in viopp visual; do
#  bindkey -M $km -- '-' vi-up-line-or-history
#  for c in {a,i}"${(s..):-\'\"\`\|,./:;-=+@}"; do
#    bindkey -M $km $c select-quoted
#  done
#  for c in {a,i}${(s..):-'()[]{}<>bB'}; do
#    bindkey -M $km $c select-bracketed
#  done
#done
#
#[[ -n $DISPLAY ]] && (( $+commands[xclip] )) && {
#
#  function cutbuffer() {
#    zle .$WIDGET
#    echo $CUTBUFFER | xclip
#  }
#
#  zle_cut_widgets=(
#    vi-backward-delete-char
#    vi-change
#    vi-change-eol
#    vi-change-whole-line
#    vi-delete
#    vi-delete-char
#    vi-kill-eol
#    vi-substitute
#    vi-yank
#    vi-yank-eol
#  )
#  for widget in $zle_cut_widgets
#  do
#    zle -N $widget cutbuffer
#  done
#
#  function putbuffer() {
#    zle copy-region-as-kill "$(xclip -o)"
#    zle .$WIDGET
#  }
#
#  zle_put_widgets=(
#    vi-put-after
#    vi-put-before
#  )
#  for widget in $zle_put_widgets
#  do
#    zle -N $widget putbuffer
#  done
#}
#
#function zle-line-init zle-keymap-select {
#    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
#    zle reset-prompt
#}
#
#zle -N zle-line-init
#zle -N zle-keymap-select
#
#export KEYTIMEOUT=10
