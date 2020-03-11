DOTFILES_SHELL="$(dirname "$(readlink "$0")")"
DOTFILES="$(dirname $(dirname "$DOTFILES_SHELL"))"

if [ "${SAVED_PATH:-==Unset==}" = "==Unset==" ]; then
    export SAVED_PATH="${PATH}"
else
    export PATH="${SAVED_PATH}"
fi

# env # # # # # # # # # # # # # # # # #

if [ -f $DOTFILES/.env ]; then
    source $DOTFILES/.env
fi

if [ -z "$CODE" ]; then CODE=$HOME/Code; fi
if [ -z "$CURRENT" ]; then CURRENT=$CODE; fi
if [ -z "$EMAIL" ]; then EMAIL=katie.k7r@gmail.com; fi

# dev # # # # # # # # # # # # # # # # #

for f in $DOTFILES_SHELL/dev/*; do
    [ -f $f ] && source $f
done

# aliases # # # # # # # # # # # # # # #

if [ -f $DOTFILES_SHELL/_aliases.sh ]; then
    source $DOTFILES_SHELL/_aliases.sh
fi

# &c  # # # # # # # # # # # # # # # # #

if [ -f /opt/git/bin/git ]; then
    export PATH=/opt/git/bin:${PATH}
    unset SSH_ASKPASS
fi

export PATH="$PATH:/usr/local/mysql/bin"
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

