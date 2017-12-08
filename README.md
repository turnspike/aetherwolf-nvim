# :wolf: ætherwolf

_glide through vim like a predator._

# :nut_and_bolt: installing for nvim

    git clone git@github.com:turnspike/aetherwolf.git ~/.config/aetherwolf
    mkdir -p ~/.config/nvim && touch ~/.config/nvim/init.vim
    echo -e "source ~/.config/aetherwolf/nvim\n$(cat ~/.config/nvim/init.vim)" > ~/.config/nvim/init.vim
    nvim +PlugInstall +qall
