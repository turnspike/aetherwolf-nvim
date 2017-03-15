# Turnspike Vimrc
The official [turnspike](https://turnspike.com) nVIM settings.

# Pre-requisites

* Homeshick, XDG environment variables set, vim-plug:
~~~~
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
printf '\nexport XDG_CONFIG_HOME=~/.config' >> $HOME/.bashrc
source $HOME/.bashrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
~~~~

## NeoVIM

    homeshick clone turnspike/vimrc
    nvim +PlugInstall +qall

## VIM (vanilla)

    homeshick clone turnspike/vimrc
    ln -s ~/.config/nvim/init.vim ~/.vimrc
    vim +PlugInstall +qall
