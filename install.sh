#!/bin/bash

# Function to prompt for overwrite
prompt_overwrite() {
  read -p "$1 already exists. Do you want to overwrite? (y/n)" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    return 0
  else
    return 1
  fi
}

# Create symlinks
[ ! -d ~/.config/nvim ] || prompt_overwrite "~/.config/nvim" && ln -sf ~/dotfiles/nvim ~/.config/nvim
[ ! -f ~/.tmux.conf ] || prompt_overwrite "~/.tmux.conf" && ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
[ ! -f ~/.config/kitty/kitty.conf ] || prompt_overwrite "~/.config/kitty/kitty.conf" && ln -sf ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
