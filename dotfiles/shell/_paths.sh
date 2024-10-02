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

if [ -d /usr/local/mysql ]; then
  export PATH="$PATH:/usr/local/mysql/bin"
  export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
fi

# nvm # # # # # # # # # # # # # # # # #

# this loads nvm
if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

# postgres  # # # # # # # # # # # # # #

if [ -d /Applications/Postgres.app ]; then
  export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
fi

# rbenv # # # # # # # # # # # # # # # #

if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# rvm # # # # # # # # # # # # # # # # #
# ensure this is the last path change

if [ -d $HOME/.rvm ]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi