[[ -s "$HOME/.shell" ]] && source "$HOME/.shell"

# zsh # # # # # # # # # # # # # # # # #

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
    # pipenv
    # poetry
    # virtualenv
)

source $ZSH/oh-my-zsh.sh

unsetopt share_history

# compatibility # # # # # # # # # # # #

# export PIPENV_SHELL_COMPAT=1
# export PIPENV_MAX_DEPTH=6
# source $(pew shell_config)

# prompt  # # # # # # # # # # # # # # #

# export VIRTUAL_ENV_DISABLE_PROMPT=
# function virtualenv_info {
#   [ $VIRTUAL_ENV ] && echo '(' `basename $VIRTUAL_ENV`') '
# }
# PROMPT+='%{$fg[green]%}$(virtualenv_prompt_info)%{$reset_color%}%'

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    # intentionally empty
  fi
}

prompt_virtualenv() {

# }

# prompt_pipenv_pyenv() {
  # if [[ -z $(pipenv --venv) || $(pipenv --venv) != "$(echo ~)/.venv" ]]; then
  if [[ ! $(pyenv version) =~ ^"3.9.1" ]]; then
    if [[ -n $PYENV_SHELL ]]; then
      local version
      version=${(@)$(pyenv version)[1]}
      if [[ $version != system ]]; then
        prompt_segment green black "$version"
      fi
    fi
  fi
}

# build_prompt() {
#   RETVAL=$?
#   prompt_status
#   prompt_virtualenv
#   # prompt_pipenv_pyenv
#   prompt_context
#   prompt_dir
#   prompt_git
#   prompt_bzr
#   prompt_hg
#   prompt_end
# }

# PROMPT='%{%f%b%k%}$(build_prompt) '

# export AGNOSTER_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

# TODO: git-prompt ; ~ prompt_git(){ git_super_status }
