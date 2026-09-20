#!/usr/bin/env bash

mkdir -p "$HOME/.config/"

# Install mise
export PATH="$HOME/.local/bin:$PATH"
curl -fsSL https://mise.run | sh
eval "$(mise activate bash)"

# Install PIXI
export PIXI_NO_PATH_UPDATE=1
ACTUAL_PIXI_HOME="${PIXI_HOME:-$HOME/.pixi}"
export PATH="$ACTUAL_PIXI_HOME/bin:$PATH"
curl -fsSL https://pixi.sh/install.sh | sh
echo "export PATH=$ACTUAL_PIXI_HOME/bin:\$PATH" >>"$HOME/.bashrc"
mkdir -p "$ACTUAL_PIXI_HOME/manifests/"

# Get the pixi-global.toml from somewhere
curl -fsSL raw.githubusercontent.com/sabarish-vm/dotfiles/main/cli_slim/pixi-global.toml >"$ACTUAL_PIXI_HOME/manifests/pixi-global.toml"
pixi g sync

# Set up the CLI tools
echo 'eval "$(fzf --bash)"' >>"$HOME/.bashrc"
echo 'eval "$(zoxide init bash)"' >>"$HOME/.bashrc"

# Neovim setup
if command -v git &>/dev/null; then
    git clone https://github.com/sabarish-vm/neovim-config -b nvim_light --depth=1 "$HOME/.config/nvim"
elif command -v curl >/dev/null &>/dev/null; then
    tmp_archive=$(mktemp)
    curl -fL https://github.com/sabarish-vm/neovim-config/archive/refs/heads/nvim_light.tar.gz -o "$tmp_archive"
    mkdir -p "$HOME/.config/nvim"
    tar -xzf "$tmp_archive" --strip-components=1 -C "$HOME/.config/nvim"
    rm -f "$tmp_archive"
else
    echo "Error: neither git nor curl is installed. Neovim config cannot be imported" >&2
fi

echo 'Restart your shell. Run "exec bash -l" or "source ~/.bashrc" or just restart shell'
