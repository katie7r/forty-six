
# cd  # # # # # # # # # # # # # # # # #

alias ..='cd ..'
alias 46='cd "$DOTFILES"'
alias code='cd "$CODE"'
alias focus='cd "$CURRENT"'

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
alias grepp='grep -nri' # my std flags
alias ungrep='grep -v'
# alias @@='grep --exclude=\*.min.\*'
alias @@='grep --exclude=\*.{min.\*,pyc} --exclude=\*/coverage/'
alias @@@='@@ --exclude=\*/{css,plugins,log,logs}/\*'
# alias @='@@ --exclude=\*/{css,js}/\* -nri'
# alias @='@@ --exclude=\*/{css,plugins}/\* -nri'
alias @='@@@ -nri'

# shortcut my preferred grep flags, plus switch arg order (dir before pattern),
# e.g., for multiple searches in the same place quickly/easily
grepper ()
{
  # # wildcard with grep
  # if [[ $1 == *"*"* ]]
  # then
  #   $GREPPATH="--include=\"$1\" ."
  # else
  #   $GREPPATH="$1"
  # fi

  # p.s. grepper is one final "g" away from being a palindrome, which is fun.
  grepp "$2" "$1"
}

# open  # # # # # # # # # # # # # # # #

# Open in Chrome
alias chrome='open -a "Google Chrome"'
# Open in Firefox
alias firefox='open -a "Firefox"'
# Open in Safari
alias safari='open -a "Safari"'

# open file in VS Code, since I aliased `code` before using VS Code and its
# included `code` command (and can never remember if it's `vs` or `vscode`)
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

# misc  # # # # # # # # # # # # # # # #

alias dirtree='tree -v --charset utf-8'

# misc functions  # # # # # # # # # # #

# find the processes running on the specified port
portcullis ()
{
    lsof -i tcp:"$1"
}

# bower: uninstall package, clear cache, and reinstall package (with pkg name
# or a URL/local filepath), e.g., $ bower-reinstall local-package /path/to/pkg
bower-reinstall ()
{
    bower uninstall "$1" && bower cache clean && bower install "${2:-$1}"
}
