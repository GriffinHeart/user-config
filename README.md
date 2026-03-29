# user-config

Dotfiles for macOS (M3 MacBook). Managed with symlinks via `install.sh`.

## Quick Start

```bash
git clone git@github.com:GriffinHeart/user-config.git ~/src/personal/user-config
cd ~/src/personal/user-config
./install.sh
```

`install.sh` symlinks necessary config files into `~/`. Safe to re-run — existing symlinks are skipped, existing files are backed up with a `.bak` suffix.

---

## Full Setup

### 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install core tools

```bash
brew install zsh tmux neovim git difftastic git-delta tmuxinator vivid zoxide eza
brew install fzf tig kdiff3 powerlevel10k
brew install gron ripgrep jq tldr wget tree asdf
brew install podman podman-compose
brew install --cask iterm2 rectangle alfred

# kdiff3: if macOS blocks it on first run, right-click the app → Open
```

Install fzf shell integration:
```bash
$(brew --prefix)/opt/fzf/install
```

### 3. Make Homebrew zsh the default shell

```bash
# note: path changed to /opt/homebrew/bin on Apple Silicon
sudo dscl . -create /Users/$USER UserShell /opt/homebrew/bin/zsh
```

### 4. Install oh-my-zsh and plugins

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd ~/.oh-my-zsh/custom/plugins
git clone --depth 1 -- https://github.com/zsh-users/zsh-autosuggestions
git clone --depth 1 -- https://github.com/zsh-users/zsh-syntax-highlighting
git clone --depth 1 -- https://github.com/Aloxaf/fzf-tab
git clone --depth 1 -- https://github.com/zsh-users/zsh-history-substring-search
```

### 5. Clone and install dotfiles

```bash
git clone git@github.com:GriffinHeart/user-config.git ~/src/personal/user-config
cd ~/src/personal/user-config
./install.sh
```

For cargo (doesn't respect XDG):
```bash
ln -s ~/src/personal/user-config/.config/cargo ~/.cargo
```

### 6. Set up iTerm2

- Download and install [Sauce Code Pro Nerd Font](https://www.nerdfonts.com/font-downloads) (regular, italic, bold, bold italic + mono variants)
- Preferences → General → Settings → Load settings from a custom folder or URL → `~/.iterm2`
- Relaunch iTerm2
- Install shell integration: iTerm2 menu → Install Shell Integration
- Enable command completion notifications: Preferences → Profiles → Terminal → Show notification when idle for X seconds

### 7. Set up git work config

```bash
nvim ~/.config/git/work_config
```

```ini
[user]
  email = <work-email>
```

### 8. Set up asdf and languages

```bash
# Python
asdf plugin add python
asdf install python <version>
asdf global python <version>
pip install pipx

# add other languages as needed
```

### 9. Set up Neovim

Plugins are managed with [lazy.nvim](https://github.com/folke/lazy.nvim) and will auto-install on first launch.

```bash
nvim
```

### 10. Set up podman

See [ansible/vscode-ansible macOS guide](https://github.com/ansible/vscode-ansible/wiki/macos).

### 11. Productivity apps

- **Alfred**: set hotkey to `⌘+space` (disable Spotlight shortcut first in System Settings → Keyboard Shortcuts)
- **Rectangle**: import `rectangle_config.json`

### 12. System settings

- Remap Caps Lock to Ctrl: System Settings → Keyboard → Modifier Keys
- Unbind `^↑` / `^↓` / `^←` / `^→` mission control shortcuts (System Settings → Keyboard Shortcuts → Mission Control) to free them for tmux pane resizing

### 13. SSH keys

```bash
mkdir ~/.ssh && chmod 700 ~/.ssh
# copy keys, then:
chmod 600 ~/.ssh/my_key ~/.ssh/my_key.pub
ssh-add --apple-use-keychain ~/.ssh/my_key
```

`~/.ssh/config`:
```
Host *
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile ~/.ssh/my_key
```

### 14. Transfer GPG keys

```bash
# on old machine
gpg --export-secret-keys <key-id> > private-key.asc
# on new machine
gpg --import private-key.asc
```

---

## Remote Headless Setup

See [setup-remote-mac.md](setup-remote-mac.md) for SSH access with sleep management.

---

## Reference

- True color in tmux+nvim: https://jdhao.github.io/2018/10/19/tmux_nvim_true_color/

---

## Problems

### pylsp / jedi Python version error

```
Failed to load hook pylsp_definitions: Python version X is currently not supported
```

Force a newer version of jedi:
```bash
pipx inject --pip-args="--upgrade" python-lsp-server jedi
```

### Erlang requires wxWidgets 3.2.x

The brew formula doesn't expose the `--with-compat30` flag needed. Download and compile wxWidgets 3.2.x manually before installing Erlang via asdf.
