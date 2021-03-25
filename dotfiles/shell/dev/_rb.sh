# env # # # # # # # # # # # # # # # # #

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

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
