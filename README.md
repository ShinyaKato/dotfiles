# .vimrc configurations

1. Install vim

```bash
sudo brew update
sudo brew install vim
```

2. Fetch dein.vim

https://github.com/Shougo/dein.vim

```bash
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein
rm installer.sh
```

3. Fetch this repository

https://github.com/ShinyaKato/dotfiles

```bash
git clone https://github.com/ShinyaKato/dotfiles.git ~/dotfiles
```

4. Create symbolic link to `~/dotfiles/.vimrc`

```bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
```

5. Run vim and type `:call dein#install()`
