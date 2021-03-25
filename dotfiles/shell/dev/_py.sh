# env # # # # # # # # # # # # # # # # #

export PIPENV_SHELL_COMPAT=true
export PIPENV_VENV_IN_PROJECT=true

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=$(pyenv which python)
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$CODE
    source /usr/local/bin/virtualenvwrapper.sh
fi

alias v='workon'
alias v.mk='mkvirtualenv'
alias v.ex='deactivate'
alias v.ls='lsvirtualenv'

# linting + formatting  # # # # # # # #

alias bk='black ${1:"."} --exclude="migrations"' # -S

# stop trying to run flake8 with the wrong version outside of a virtual env
alias flake8="echo \"If you meant to run flake8 outside of a virtual environment, use 'vlake8' instead.\""
alias vlake8="command flake8"

# &c  # # # # # # # # # # # # # # # # #

# delete all Python migration files in project
alias rm-migrations='find . -path "*/migrations/*.py*" -not -name "__init__.py" -delete'

