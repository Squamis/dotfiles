#This is my bootstrap script for installing things neovim and its dependencies 
#Thomas Haffenreffer April 28, 2025


#=============================================================================
#Index
#=============================================================================

# Vim
# Git
# Neovim
# bash 
# Tmux




#=============================================================================
# 1. Vim and Vim plugins
#=============================================================================

#This section is untested 

#!/bin/bash
echo "Starting Vim setup..."

# Define where vim-plug should be
PLUG_VIM_PATH="$HOME/.vim/autoload/plug.vim"

# Step 1: Check for vim-plug
if [ -f "$PLUG_VIM_PATH" ]; then
    echo "vim-plug already installed. Skipping installation."
else
    echo "vim-plug not found. Installing vim-plug..."
    curl -fLo "$PLUG_VIM_PATH" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Error handling: check if curl succeeded
    if [ $? -eq 0 ]; then
        echo "vim-plug installed successfully."
    else
        echo "Error: Failed to install vim-plug!" >&2
        exit 1
    fi
fi

# Step 2: Install plugins listed in your .vimrc
echo "Installing Vim plugins using vim-plug..."

# Run Vim in headless mode to install plugins automatically
vim +'PlugInstall --sync' +qa

# Error handling: check if Vim command succeeded
if [ $? -eq 0 ]; then
    echo "Vim plugins installed successfully."
else
    echo "Error: Failed to install Vim plugins!" >&2
    exit 2
fi

echo "Vim setup complete."

# (Optional) Install other tools, fonts, Zsh plugins, etc.




#=============================================================================
# NeoVim plugins
#=============================================================================
