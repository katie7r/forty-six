# env # # # # # # # # # # # # # # # # #

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.bin:$PATH"
# export PATH="$HOME/.bin:$PATH:$HOME/.rvm/bin"

# support for rbenv
if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# linting + formatting  # # # # # # # #

alias autocop='rubocop -a --only'
alias atcop='rubocop --only'
alias cop='rubocop | grep -i ${1}'

# rails # # # # # # # # # # # # # # # #

alias .rails='bin/rails' # bin/rails for local commands

# if `.r` is called with `dev`, do the annoying db:env:set
# thing for development
.r ()
{
    if [[ $@ == "dev" ]]; then
        command bin/rails db:environment:set RAILS_ENV=development

    else
        command bin/rails "$@"
    fi
}

# &c  # # # # # # # # # # # # # # # # #

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"
