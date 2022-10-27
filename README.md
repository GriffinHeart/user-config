Structure of repo and configs inspired and somewhat copied from [craftzdog/dotfiles-public](https://github.com/craftzdog/dotfiles-public/)

since the modernization of my config files circa 2022

git submodule init

git submodule update

----
For Mac


to export iTerm2 settings: 

plutil -convert xml1 ~/Library/Preferences/com.googlecode.iterm2.plist -o ./com.googlecode.iterm2.plist


to import:

plutil -convert binary1 com.googlecode.iterm2.plist -o ~/Library/Preferences/com.googlecode.iterm2.plist


----

Setting up true color: https://jdhao.github.io/2018/10/19/tmux_nvim_true_color/

----

Setup:

1. install brew
2. basic tools `brew install zsh iterm2 tmux neovim git chrome`
3. install oh-my-zsh
4. clone the user-config repo into `src/personal/user-config`
  - `ln -s  ~/src/personal/user-config/.config`
5. create git work config file with user info
  - `neovim ~/.config/git/work_config`
```
[user]
  email = <work-email>
```
3. setup iterm2
  - Download SourceCodePro font [link](https://www.nerdfonts.com/font-downloads)
  - Install Sauce Code Pro Nerd Font Complete.ttf and Mono version ttf (regular, italic, bold, bold italic)
  - Pref->General->Pref load preferences directly from user-config file
  - Don't save now just relaunch iTerm2 to take effect
4. make the brew zsh default (see [link](https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/)
  - brew info zsh (note the path)
  - `sudo dscl . -create /Users/$USER UserShell <shell-path>`
5. Setup `.zshrc`
  - `cd ~/.oh-my-zsh/custom/plugins`
  - `git clone --depth 1 -- https://github.com/zsh-users/zsh-autosuggestions`
  - `git clone --depth 1 -- https://github.com/zsh-users/zsh-syntax-highlighting`
  - `ln ~/src/personal/user-config/.zshrc .zshrc`
3. productivity tools `brew install alfred rectangle google-drive keepassxc tmuxinator`
4. essential terminal tools `brew install fzf tig kdiff3`
  - Note: If you get `Can't be opened because...` error on kdiff3 go to Application right click open
  - install fzf completions `$(brew --prefix)/opt/fzf/install`
5. misc tools `brew install gron rg jq tldr wget tree asdf`
6. go get a coffee
7. Unbind mac keyboard shortcuts
  - c-up-arrow
7. Make capslock ctrl
7. Alfred
  - ⌘+space
8. Rectangle
  - import rectangle_config.json
9. Configure google-drive
  - sync hugo/pessoal folder
10. Configure keepassxc
11. Get and Sync private keys to keychain
  - `mkdir ~/.ssh`
  - `chmod 600 ~/.ssh`
  - Get keys
  - Set keys permissions `chmod 600 ~/.ssh/my_key` and `chmod 600 ~/.ssh/my_key.pub`
  - Set `~/.ssh/config`
```
 Host *
   UseKeychain yes
   AddKeysToAgent yes
   IdentityFile ~/.ssh/my_key1
   IdentityFile ~/.ssh/my_key2
```
  - Add them to keychain with `ssh-add --apple-use-keychain ~/.ssh/my_priv_key`
12. install packer for neovim
13. asdf
  - install python plugin and install python version
	- `asdf global python <version>
	- install pipx into that version `pip install pipx`
