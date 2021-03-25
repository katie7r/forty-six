# git # # # # # # # # # # # # # # # # #

if [ -f /opt/git/bin/git ]; then
    export PATH=/opt/git/bin:${PATH}
    unset SSH_ASKPASS
fi

# libpq # # # # # # # # # # # # # # # #

export LDFLAGS="-L/usr/local/opt/libpq/lib"
export CPPFLAGS="-I/usr/local/opt/libpq/include"
export PKG_CONFIG_PATH="/usr/local/opt/libpq/lib/pkgconfig"

# mysql # # # # # # # # # # # # # # # #

export PATH="$PATH:/usr/local/mysql/bin"
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

# nvm # # # # # # # # # # # # # # # # #

# this loads nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# poetry  # # # # # # # # # # # # # # #

export PATH="$HOME/.poetry/bin:$PATH"

# postgres  # # # # # # # # # # # # # #

export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# rbenv # # # # # # # # # # # # # # # #

if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# rvm # # # # # # # # # # # # # # # # #
# ensure this is the last path change

export PATH="$PATH:$HOME/.rvm/bin"
# export PATH="$HOME/.bin:$PATH"
