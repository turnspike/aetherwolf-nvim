# ætherwolf

_glide through nvim like a predator._

# Pre-requisites

* [Homesick](https://github.com/technicalpickles/homesick), [XDG environment variables](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) set
~~~~
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
printf '\nexport XDG_CONFIG_HOME=~/.config' >> $HOME/.bashrc
source $HOME/.bashrc
~~~~

## NeoVIM

    homesick clone turnspike/vimrc
    nvim +PlugInstall +qall

## VIM (vanilla)

    homesick clone turnspike/vimrc
    ln -s ~/.config/nvim/init.vim ~/.vimrc
    vim +PlugInstall +qall
