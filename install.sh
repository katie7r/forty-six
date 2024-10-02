#! /bin/bash

# # # # # # # # # # # # # # # # # # # #
#               INSTALL               #
# # # # # # # # # # # # # # # # # # # #
# Based on nix/bootstrap.sh from      #
# https://github.com/jeffaco/dotfiles #
# # # # # # # # # # # # # # # # # # # #

case $0 in
    /*|~*)
        RUN_FROM="`dirname $0`"
        ;;
    *)
        PWD="`pwd`"
        RUN_FROM="`dirname $PWD/$0`"
        ;;
esac

DOTFILES="`(cd \"$RUN_FROM\"; pwd -P)`"

for d in $DOTFILES/dotfiles/*; do
    # skip any non-directories directly in /dotfiles/
    [ ! -d $d ] && continue

    for f in $d/*; do
        # skip any nested directories
        [ -d $f ] && continue

        # e.g., gitconfig -> ~/.gitconfig
        # e.g., shell.sh -> ~/.shell
        FILE=`basename -s .sh $f`
        LINK=$HOME/.$FILE

        # ignore files prefixed with underscore
        [[ $FILE == _* ]] && continue

        if [ -f $LINK -o -h $LINK ]; then
            if [[ -L "$LINK" ]]; then
                echo "Replacing: $LINK"
                rm $LINK
                ln -s $f $LINK
            else
                echo "File already exists: $LINK"
            fi
        else
            echo "Linking: $LINK"
            ln -s $f $LINK
        fi

        # ln -s $f $LINK
    done
done

# # # # # # # # # # # # # # # # # # # #
#           GIT COMPLETION            #
# # # # # # # # # # # # # # # # # # # #

if [ ! -f $HOME/.git-completion.bash ]; then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o $HOME/.git-completion.bash
fi

if [ ! -d $HOME/.zsh ]; then mkdir $HOME/.zsh; fi
if [ ! -f $HOME/.zsh/.git-completion.zsh ]; then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -o $HOME/.zsh/.git-completion.zsh
fi

if [ ! -f $HOME/.git-prompt.sh ]; then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o $HOME/.git-prompt.sh
fi

# # # # # # # # # # # # # # # # # # # #
#             ENV CONFIG              #
# # # # # # # # # # # # # # # # # # # #

if [ -f $DOTFILES/.env ]; then
    source $DOTFILES/.env

    if [ -n "$EMAIL" ]; then
        git config --global user.email $EMAIL
    fi
fi
