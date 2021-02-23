# alias python=/usr/local/bin/python3

# env # # # # # # # # # # # # # # # # #

export PIPENV_SHELL_COMPAT=true
export PIPENV_VENV_IN_PROJECT=true

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    # VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
    VIRTUALENVWRAPPER_PYTHON=$(which python)
    # VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    # VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
    # VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export VIRTUALENVWRAPPER_PYTHON
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$CODE
    source /usr/local/bin/virtualenvwrapper.sh
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

POETRY_PATH="$HOME/.poetry/bin"
PATH="$PATH:$POETRY_PATH"

# alias docker-poetry='docker-compose run -e EDITOR="code --wait" --rm web poetry run'
alias docker-poetry='docker-compose run --rm web poetry'
alias dp='docker-poetry'
alias dpm='docker-poetry run ./manage.py'
alias dpt='docker-poetry run py.test'

alias pipenv3='pipenv --three'
alias pipenv2='pipenv --two'

alias pyenv='CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv'

alias v='workon'
alias v.mk='mkvirtualenv --python=`which python3`'
alias v.ex='deactivate'
alias v.ls='lsvirtualenv'

# linting + formatting  # # # # # # # #

# alias bk='black ${1:"."} -S --exclude="migrations"'
alias bk='black ${1:"."} --exclude="migrations"'

# stop trying to run flake8 with the wrong version outside of a virtual env
alias flake8="echo \"If you meant to run flake8 outside of a virtual environment, use 'vlake8' instead.\""
alias vlake8="command flake8"

# &c  # # # # # # # # # # # # # # # # #

# delete all Python migration files in project
alias rm-migrations='find . -path "*/migrations/*.py*" -not -name "__init__.py" -delete'

