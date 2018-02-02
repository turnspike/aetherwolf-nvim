# :wolf: ætherwolf

_glide through shell like a predator._

All installation steps are non-destructive; they tap into your existing configuration files, or create stubs if you have none.


# :nut_and_bolt: installing base package

    mkdir -p ~/.config                                                                 # create .config dir if needed
    git clone https://github.com/turnspike/aetherwolf.git ~/.config/aetherwolf         # wolf me up
    
# :nut_and_bolt: installing nvim mod

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                # install vim plugin manager
    
    mkdir -p ~/.config/nvim && touch ~/.config/nvim/init.vim                           # ensure nvim config file exists
    echo -e "source ~/.config/aetherwolf/nvim/init.vim" >> ~/.config/nvim/init.vim     # tap into nvim config
    nvim +PlugInstall +qall                                                            # install new vim plugins

# :nut_and_bolt: installing zsh mod
    brew install exa fzf chruby                                                        # install homebrew dependencies
    /usr/local/opt/fzf/install                                                         # install fzf autocomplete (recommended options - enable fuzzy: yes, enable bindings: yes, update shell cfg: no)
    touch ~/.zshenv && echo -e "source ~/.config/aetherwolf/zsh/env.zsh" >> ~/.zshenv  # tap into zsh env config
    touch ~/.zshsrc && echo -e "source ~/.config/aetherwolf/zsh/main.zsh" >> ~/.zshrc  # tap into zsh main config
