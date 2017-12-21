# :wolf: ætherwolf

_glide through vim like a predator._

# installing

    mkdir -p ~/.config
    git clone git@github.com:turnspike/aetherwolf.git ~/.config/aetherwolf
    
# :nut_and_bolt: installing for nvim

    mkdir -p ~/.config/nvim && touch ~/.config/nvim/init.vim
    echo -e "source ~/.config/aetherwolf/nvim/init.vim\n$(cat ~/.config/nvim/init.vim)" > ~/.config/nvim/init.vim
    nvim +PlugInstall +qall

# installing for vim

    touch .vimrc
    echo -e "source ~/.config/aetherwolf/nvim/init.vim\n$(cat ~/.config/nvim/init.vim)" > ~/.vimrc
    vim +PlugInstall +qall
