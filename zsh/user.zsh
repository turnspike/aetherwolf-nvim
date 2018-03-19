#!/bin/zsh

if ! [[ "$(uname)"="Darwin" ]]; then
	pidof -c dropbox > /dev/null || ~/bin/dropbox.py start # start dropbox if not running

	alias enc-mount="cryfs ~/Dropbox/Encrypted ~/Private"
	alias enc-unmount="fusermount -u ~/Private"

	# mount encrypted local folder ~/Private if not already mounted
	if [[ ! -d "$HOME/Private" ]]; then
		enc-mount
	fi
	# should this be unmounted in ~/.zlogout?
fi

# load ssh key for github etc (only if not already loaded)
# http://unix.stackexchange.com/questions/132791/have-ssh-add-be-quiet-if-key-already-there
if [ -f ~/.ssh/id_rsa ]; then
    pp_msg "loading ~/.ssh/id_rsa"
    ssh-add -l | grep -q `ssh-keygen -lf ~/.ssh/id_rsa | awk '{print $2}'` || ssh-add ~/.ssh/id_rsa
fi

