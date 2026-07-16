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
link .pryrc     .pryrc
link services   services

# LaunchAgents — symlink each plist then load if not already loaded
mkdir -p "$HOME/Library/LaunchAgents"
for plist in "$REPO_DIR/launchagents/"*.plist; do
  name=$(basename "$plist")
  dst="$HOME/Library/LaunchAgents/$name"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$plist" ]; then
    echo "  ok  $dst"
  else
    [ -e "$dst" ] && mv "$dst" "$dst.bak" && echo "  backing up  $dst"
    ln -s "$plist" "$dst"
    echo "  linked  $dst -> $plist"
  fi
  launchctl list | grep -q "${name%.plist}" || launchctl load "$dst" && echo "  loaded  $name"
done

# LaunchDaemon — requires sudo, copy (can't symlink into /Library/LaunchDaemons/)
DAEMON_SRC="$REPO_DIR/services/caddy/com.local.pf-forward.plist"
DAEMON_DST="/Library/LaunchDaemons/com.local.pf-forward.plist"
if [ -f "$DAEMON_DST" ]; then
  echo "  ok  $DAEMON_DST"
else
  echo "  installing pf LaunchDaemon (requires sudo)..."
  sudo cp "$DAEMON_SRC" "$DAEMON_DST"
  sudo launchctl load "$DAEMON_DST"
  echo "  loaded  com.local.pf-forward"
fi

echo "Done."
