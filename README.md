# .vimrc configurations

1. Install Vim

```bash
sudo brew update
sudo brew install vim
```

2. Fetch NeoBundle

https://github.com/Shougo/neobundle.vim

```bash
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
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

5. Run vim and type :NeoBundleInstall
