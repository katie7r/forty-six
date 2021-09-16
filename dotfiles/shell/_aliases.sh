
# cd  # # # # # # # # # # # # # # # # #

alias ..='cd ..'
alias 46='cd "$DOTFILES"'
alias code='cd "$CODE"'
alias current='cd "$CURRENT"'

# ls  # # # # # # # # # # # # # # # # #

if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
fi

alias .='ls -A'
alias la='ls -1A'
alias ll='ls -alF'
alias l='ls -CF'

# grep  # # # # # # # # # # # # # # # #

if [ -x /usr/bin/dircolors ]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# grep but with color!
alias grep='grep --color=always'

alias ungrep='grep -v'
alias grep-min='grep --exclude=\*.min.\*'
alias grep-pyc='grep --exclude=\*.{min.\*,pyc} --exclude=\*/coverage/'
alias grep-less='grep-pyc --exclude=\*/{css,plugins,log,logs}/\*'
alias @='grep-less -nri'

# shortcut my preferred grep flags, plus switch arg order (dir before pattern),
# e.g., for multiple searches in the same place quickly/easily
gerp ()
{
  # # wildcard with grep
  # if [[ $1 == *"*"* ]]
  # then
  #   $GREPPATH="--include=\"$1\" ."
  # else
  #   $GREPPATH="$1"
  # fi

  # p.s. this function was originally called `grepper`,
  # which is one final "g" away from being a palindrome... which is fun.
  grep -nri "$2" "$1"
}

# open  # # # # # # # # # # # # # # # #

alias chrome='open -a "Google Chrome"'
alias firefox='open -a "Firefox"'
alias safari='open -a "Safari"'

# open file in VS Code, since I already have `code` aliased
# (and can never remember whether it's `vs` or `vscode`)
alias vscode='open -a "Visual Studio Code"'
alias vs='vscode'

fenestrate ()
{
    if [ -n $FENESTRATE ]; then
        # TODO skip if already running
        cd $FENESTRATE && http-server &

        # TODO ! supply args to query params for url (and url var for reuse) for framed to use
        # TODO ~ more dynamic browser choice

        if [ $# -eq 0 ]
        then
            chrome "http://localhost:8080"
        elif [[ $1 = 'safari' ]]
        then
            safari "http://localhost:8080"
        elif [[ $1 = 'firefox' ]]
        then
            firefox "http://localhost:8080"
        else
            chrome "http://localhost:8080"
        fi
    fi
}

# git # # # # # # # # # # # # # # # # #

alias gap='git add ${1:-"."} --patch'

# docker  # # # # # # # # # # # # # # #

alias dock='docker-compose up'
alias dock-it="docker exec -it $1 $*"

# misc  # # # # # # # # # # # # # # # #

alias dirtree='tree -v --charset utf-8'

# misc functions  # # # # # # # # # # #

# find the processes running on the specified port
portcullis ()
{
    lsof -i tcp:"$1"
}
alias port=portcullis

# bower: uninstall package, clear cache, and reinstall package (with pkg name
# or a URL/local filepath), e.g., $ bower-reinstall local-package /path/to/pkg
bower-reinstall ()
{
    bower uninstall "$1" && bower cache clean && bower install "${2:-$1}"
}
