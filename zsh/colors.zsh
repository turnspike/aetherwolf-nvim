#!/bin/zsh
autoload -U colors && colors # load color support
#http://unix.stackexchange.com/questions/19498/understanding-colors-in-zsh

c_reset="$(tput sgr0)"
c_title="$(tput setaf 7)$(tput setab 2)"
c_msg="$(tput setaf 2)"
c_error="$(tput setaf 7)$(tput setab 1)"

# -- pretty print message
aw_msg () {
    printf "$c_msg" $1 "$c_reset"
}

# -- pretty print title
aw_title () {
    printf "\n"$c_title" $1 "$c_reset"\n"
}
