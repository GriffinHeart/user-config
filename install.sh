#!/bin/zsh

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$REPO_DIR/$1"
  local dst="$HOME/$2"

  if [ -L "$dst" ]; then
    if [ "$(readlink "$dst")" = "$src" ]; then
      echo "  ok  $dst"
      return
    else
      echo "  relinking  $dst"
      rm "$dst"
    fi
  elif [ -e "$dst" ]; then
    echo "  backing up  $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi

  ln -s "$src" "$dst"
  echo "  linked  $dst -> $src"
}

echo "Installing dotfiles from $REPO_DIR"

link .config    .config
link .zshrc     .zshrc
link .p10k.zsh  .p10k.zsh
link .iterm2    .iterm2

echo "Done."
