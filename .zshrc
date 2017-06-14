source ~/.bin/tmuxinator.zsh
export HOMEBREW_GITHUB_API_TOKEN='cf7a60e177850c1189a06657c913ea5453897225'
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export VISUAL=vim
export EDITOR="$VISUAL"
export REPO_PATH=~/src/di
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
DEFAULT_USER="griffin"
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
#CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# Customize to your needs...
plugins=(git encode64 lol nyan yum)

source $ZSH/oh-my-zsh.sh

source /opt/boxen/env.sh
# makes terminal behave like vim
bindkey -e

# fixes git completition on zsh slowness
# see http://stackoverflow.com/questions/9810327/git-tab-autocompletion-is-useless-can-i-turn-it-off-or-optimize-it/9810485#9810485
__git_files () { 
	    _wanted files expl 'local files' _files     
}

alias ll="ls -lah"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc="vim ~/.zshrc && reload"
alias tasks="cd ~/src/tasks && git pull && vim tasks.md"

#fixes C-s in mac os and some other bindings
stty start undef stop undef
stty -ixon -ixoff

DOCKER_HOST=tcp://localhost:4243

export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_AMITOOL_HOME="/opt/boxen/homebrew/Cellar/ec2-ami-tools/1.5.3/libexec"
export EC2_HOME="/opt/boxen/homebrew/Cellar/ec2-api-tools/1.7.1.0/libexec"

export PATH="/usr/local/heroku/bin:$PATH"
eval "$(rbenv init -)"
. ~/z.sh
