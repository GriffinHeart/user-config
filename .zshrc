# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export XDG_CONFIG_HOME="$HOME/.config/"
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export VISUAL=nvim
export EDITOR="$VISUAL"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

HYPHEN_INSENSITIVE="true"

plugins=(
    direnv
    gitfast
    z
    fzf-tab
    zsh-autosuggestions
    zsh-syntax-highlighting
  	web-search
    asdf
)

source $ZSH/oh-my-zsh.sh

bindkey -e

alias vim="nvim"
alias ll="ls -lh"
alias lla="ls -lah"
alias mkdir="mkdir -p"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc="vim ~/.zshrc && reload"
alias mux="tmuxinator"

alias notes='vim ~/notes.md'
alias work='vim ~/work.md'
alias scratch='vim ~/scratch.md'
alias tasks='vim ~/tasks.md'
alias admin='vim ~/administrative.md'
alias confnvim='vim ~/.config/nvim/'
alias confgit='vim ~/.config/git/'

alias docker='podman'
alias docker-compose='podman-compose'

alias www="python -m http.server"
alias gfx='git commit --fixup $(git log $(git merge-base main HEAD)..HEAD --oneline| fzf| cut -d" " -f1)'


# ls colors
export LS_COLORS="$(vivid generate tokyonight-storm)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

if [[ "$(uname)" == "Darwin" ]]; then
  alias ls="gls --color=auto"
fi
# Enable autocomplete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export ASDF_GOLANG_MOD_VERSION_ENABLED=true

export GPG_TTY=$(tty)
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
