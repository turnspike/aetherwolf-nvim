#!/bin/zsh
autoload -U colors && colors # load color support
#http://unix.stackexchange.com/questions/19498/understanding-colors-in-zsh

#ESC_SEQ="\x1b["
#ESC_RESET=$ESC_SEQ"39;49;00m"
#ESC_GREEN=$ESC_SEQ"32;01m"
#ESC_RED=$ESC_SEQ"1;31m"

c_reset="$(tput sgr0)"
c_title="$(tput setaf 7)$(tput setab 2)"
c_msg="$(tput setaf 2)"
c_error="$(tput setaf 7)$(tput setab 1)"

pp_msg () {
    printf "\n"$c_msg" $1 "$c_reset"\n"
}

pp_title () {
    printf "\n"$c_title" $1 "$c_reset"\n"
}
