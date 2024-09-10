alias mpy="python manage.py"

# env # # # # # # # # # # # # # # # # #

# pipenv
export PIPENV_SHELL_COMPAT=true
export PIPENV_VENV_IN_PROJECT=true

alias pipe="pipenv run"
alias pmp="pipe ./manage.py"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# virtualenv(wrapper)
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

# ruff --fix changed files

ruff-fix()
{
  # Fix files with staged changes
  if [[ $1 = "staged" ]] || [[ $1 = "added" ]] || [[ $1 = "A" ]]; then
    GIT_STATE="A"
  # Fix files with unstaged changes
  elif [[ $1 = "unstaged" ]] || [[ $1 = "unadded" ]] || [[ $1 = "modified" ]] || [[ $1 = "M" ]]; then
    GIT_STATE="M"
  # Fix untracked files
  elif [[ $1 = "untracked" ]] || [[ $1 = "new" ]] || [[ $1 = "U" ]] || [[ $1 = "??" ]]; then
    GIT_STATE="??"
  # Fix all modified files (staged/unstaged/untracked/whatever)
  else
    GIT_STATE="."
  fi

  git st -s | grep "$GIT_STATE" | cut -c 4- | xargs ruff --fix
}

# alias bk='black ${1:-"."} -S --exclude="migrations"'
bk()
{
  black ${1:-"."} --exclude="migrations"
}

bk-git-add-patch() {
  # TODO: git diff --name-only

  # pipe black ${1:-"."} && git add ${1:-"."} --patch

  if [ "$#" -eq 0 ]; then
    pipe black $(git diff --name-only) && git add $(git diff --name-only) --patch
  else
    pipe black $1 && git add $1 --patch
  fi
}
alias bk-gap="bk-git-add-patch"
alias gap-bk="bk-git-add-patch"

# stop trying to run flake8 with the wrong version outside of a virtual env
alias flake8="echo \"If you meant to run flake8 outside of a virtual environment, use 'vlake8' instead.\""
alias vlake8="command flake8"

# &c  # # # # # # # # # # # # # # # # #

# delete all Python migration files in project
alias rm-migrations='find . -path "*/migrations/*.py*" -not -name "__init__.py" -delete'

# django boilerplate create app shorthand
startapp() {
  # Get project from pwd (presuming in project root and naming convention of project.api)
  PROJECT_DIR=${PWD##*/}
  IFS='.' read -r PROJECT APICOM <<< "$PROJECT_DIR"

  # Get app name (from arg) and directory (from project + app name)
  APP_NAME=$1
  APP_DIR="${PROJECT}/apps/${APP_NAME}"

  # Do the thing
  mkdir -p $APP_DIR && python manage.py startapp $APP_NAME $APP_DIR
}
