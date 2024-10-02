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

### Powerline Fonts
```
git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. && rm -rf fonts
```
Then (for iTerm2) set both the Regular font and the Non-ASCII Font in "iTerm > Preferences > Profiles > Text" to use a patched font.

### Oh-My-Zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
Note: If oh-my-zsh is installed after running the installation script, it will rename `.zshrc` (to `.zshrc.pre-oh-my-zsh`) and replace it with its own.

### asdf
```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
```
Note: [Check/update the current version before installing.](https://asdf-vm.com/guide/getting-started.html)

# Other Things to Set Up

### iTerm

**Shell Integration**

Settings > Profiles > General > Commands > check "Load shell integration automatically"

**Working Directory**

Settings > Profiles > General > Working Directory > Advanced Configuration [Edit...]

- New windows: ~/Code
- New tabs: ~/Code
- New panes: Reuse previous session

**Natural Text Editing**

Settings > Profiles > Keys > Key Mappings > (...) Presets > Natural Text Editing

**Monokai Color Scheme**
[https://github.com/adorabilis/monokai-pro-iterm2](https://github.com/adorabilis/monokai-pro-iterm2)

### VS Code Settings Sync
