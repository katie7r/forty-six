[[ -s "$HOME/.shell" ]] && source "$HOME/.shell"

# zsh # # # # # # # # # # # # # # # # #

export ZSH_DISABLE_COMPFIX=true

[ -f "$HOME/.git-completion.zsh" ] && source "$HOME/.git-completion.zsh"

fpath=(~/.zsh $fpath)
fpath+=~/.zfunc

# original zshrc  # # # # # # # # # # #

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME='agnoster'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git git-prompt
    docker docker-compose
    heroku
    npm nvm
    osx
    postgres
    python
)

source $ZSH/oh-my-zsh.sh

unsetopt share_history

# prompt  # # # # # # # # # # # # # # #

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    # intentionally empty
  fi
}

# TODO: git-prompt ; ~ prompt_git(){ git_super_status }
