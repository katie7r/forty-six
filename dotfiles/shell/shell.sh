# DOTFILES_SHELL="$(dirname "$(readlink -f -- "$0")")"
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

# paths # # # # # # # # # # # # # # # #

if [ -f $DOTFILES_SHELL/_paths.sh ]; then
    source $DOTFILES_SHELL/_paths.sh
fi

# &c  # # # # # # # # # # # # # # # # #

if [ -d $HOME/.asdf ]; then
    source $HOME/.asdf/asdf.sh
fi