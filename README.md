# :wolf: ætherwolf

_glide through vim like a predator._

# :nut_and_bolt: installing base package

    mkdir -p ~/.config
    git clone https://github.com/turnspike/aetherwolf.git ~/.config/aetherwolf
    
# :nut_and_bolt: installing nvim mod

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
    mkdir -p ~/.config/nvim && touch ~/.config/nvim/init.vim
    echo -e "source ~/.config/aetherwolf/nvim/init.vim" >> ~/.config/nvim/init.vim
    nvim +PlugInstall +qall

# :nut_and_bolt: installing zsh mod
    touch ~/.zshenv
    echo -e "source ~/.config/aetherwolf/zsh/env.zsh" >> ~/.zshenv
    touch ~/.zshsrc
    echo -e "source ~/.config/aetherwolf/zsh/main.zsh" >> ~/.zshrc
