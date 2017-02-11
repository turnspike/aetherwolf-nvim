# Turnspike Vimrc
The official [turnspike](https://turnspike.com) nVIM settings.

# Installation

Requires [homeshick](https://github.com/andsens/homeshick) or homesick.

## NeoVIM

    homeshick clone turnspike/vimrc
    nvim +PlugInstall +qall

## VIM (vanilla)

    homeshick clone turnspike/vimrc
    ln -s ~/.config/nvim/init.vim ~/.vimrc
    vim +PlugInstall +qall
