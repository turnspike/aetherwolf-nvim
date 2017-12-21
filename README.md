# :wolf: ætherwolf

_glide through vim like a predator._

# :nut_and_bolt: installing

    mkdir -p ~/.config
    git clone git@github.com:turnspike/aetherwolf.git ~/.config/aetherwolf
    
# :nut_and_bolt: installing for nvim

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
    mkdir -p ~/.config/nvim && touch ~/.config/nvim/init.vim
    echo -e "source ~/.config/aetherwolf/nvim/init.vim\n$(cat ~/.config/nvim/init.vim)" > ~/.config/nvim/init.vim
    nvim +PlugInstall +qall

# :nut_and_bolt: installing for vim

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    touch .vimrc
    echo -e "source ~/.config/aetherwolf/nvim/init.vim\n$(cat ~/.config/nvim/init.vim)" > ~/.vimrc
    vim +PlugInstall +qall
