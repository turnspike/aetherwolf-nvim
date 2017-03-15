# Turnspike Vimrc
turnspike's vim settings.

# Pre-requisites

* [Homeshick](https://github.com/andsens/homeshick), [XDG environment variables](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) set, [vim-plug](https://github.com/junegunn/vim-plug):
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
