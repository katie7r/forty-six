DOTFILES_SHELL="$(dirname "$(readlink "$0")")"
DOTFILES="$(dirname $(dirname "$DOTFILES_SHELL"))"

# env # # # # # # # # # # # # # # # # #

if [ -f $DOTFILES/.env ]; then
    source $DOTFILES/.env
fi

if [ -z "$CODE" ]; then CODE=$HOME/Code; fi
if [ -z "$CURRENT" ]; then CURRENT=$CODE; fi
if [ -z "$EMAIL" ]; then EMAIL=katie.k7r@gmail.com; fi

