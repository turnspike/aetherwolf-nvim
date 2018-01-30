# ---- DIR CONFIG ----
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export ZCONF=$XDG_CONFIG_HOME/aetherwolf/zsh # path to zsh config

# ---- MACOS ----
if [[ "$OSTYPE" == "darwin"* ]]; then # homebrew configs for macos
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/usr/local/opt/sqlite/bin:$PATH"
  export M2_REPO="~/.m2"
fi
