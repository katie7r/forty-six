# Forty-Six

These are my dotfiles. This is where they live.

# To Use

    $ git clone git@github.com:katie7r/forty-six.git 46
    $ cd 46
    $ touch .env
    $ ./install.sh

# To Uninstall

For now, just remove the symlinks in $HOME. 🤷🏻‍♀️

`&#46;`

# Other Things to Install

### Oh-My-Zsh
```sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```

### Powerline Fonts
```
git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. && rm -rf fonts
```
Then (for iTerm2) set both the Regular font and the Non-ASCII Font in "iTerm > Preferences > Profiles > Text" to use a patched font.

# Other Things to Set Up

### VS Code Settings Sync
