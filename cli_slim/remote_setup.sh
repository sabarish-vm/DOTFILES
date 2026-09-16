#!/usr/bin/env bash

# Install PIXI
export PIXI_NO_PATH_UPDATE=1
curl -fsSL https://pixi.sh/install.sh | sh
ACTUAL_PIXI_HOME="${PIXI_HOME:-$HOME/.pixi}"
echo "export PATH=$ACTUAL_PIXI_HOME/bin:\$PATH" >>"$HOME/.bashrc"
export PATH="$ACTUAL_PIXI_HOME/bin:$PATH"
mkdir -p "$ACTUAL_PIXI_HOME/manifests/"

# Get the pixi-global.toml from somewhere
curl -fsSL raw.githubusercontent.com/sabarish-vm/dotfiles/main/cli_slim/pixi-global.toml >"$ACTUAL_PIXI_HOME/manifests/pixi-global.toml"
pixi g sync

# Set up the CLI tools
echo 'eval "$(fzf --bash)"' >>"$HOME/.bashrc"
echo 'eval "$(zoxide init bash)"' >>"$HOME/.bashrc"
