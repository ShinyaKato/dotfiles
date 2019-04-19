# dotfiles

https://github.com/ShinyaKato/dotfiles

Clone this repository to `~/dotfiles`.

```bash
git clone https://github.com/ShinyaKato/dotfiles.git ~/dotfiles
```


## bash settings

1. Install bash

```bash
brew install bash
```

2. Change login shell

```bash
sudo bash -c "echo $(which bash) >> /etc/shells"
chsh -s $(which bash)
```

3. Create symbolic link

```bash
ln -s ~/dotfiles/.bashrc ~/.bashrc
```

4. Add `source ~/.bashrc` to `~/.bash_profile`


## vim settings

1. Install vim

```bash
brew update
brew install vim -- --with-lua --with-python3
```

Install ag and gtags.

```bash
brew install ag
brew install global -- --with-pygments
```

denite.nvim requires `pynvim` module.

```bash
pip3 install --user pynvim
```

2. Fetch dein.vim

https://github.com/Shougo/dein.vim

```bash
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s ~/.vim/dein
```

3. Create symbolic link

```bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
```

4. Run vim and type `:call dein#install()`
