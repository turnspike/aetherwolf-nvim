#!/bin/zsh

## find file with pattern in name
function ff() { find . ! -readable -prune -o -type f -iname '*'"$*"'*' -ls -print; }

## create ZIP archive of a file or folder
function zipf() { zip -r "${1%%/}.zip" "$1" ; }

## make directories and files access rights sane
function fixperms() { chmod -R u=rwX,g=rX,o= "$@" ; }

extract() {
    if [ -f $1  ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

zsh_reload() {
    zplug clear; source ~/.zshrc
}

# TODO: function cdp - cd to parent folder of symlinked file

copy-production-to() {
  if [ "$1" != "staging" ] && [ "$1" != "development" ]; then
    echo >&2 "Usage: copy-production-to <staging|development>"
    return 1
  else
    production backup && "$1" restore production
  fi
}

# Provide tab completion of either "staging" or "development"
_copy-production-to() { reply=(development staging) }
compctl -K _copy-production-to copy-production-to
