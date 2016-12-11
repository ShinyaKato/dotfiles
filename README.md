# 設定

1. NeoBundleをGitHubから取ってくる
https://github.com/Shougo/neobundle.vim

```
$ mkdir -p ~/.vim/bundle
$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

2. このリポジトリをGitHubから取ってくる
https://github.com/ShinyaKato/dotfiles

```
git clone https://github.com/ShinyaKato/dotfiles.git ~/dotfiles
```

3. `~/dotfiles/.vimrc`へのシンボリックリンクを作成

linux:   `ln -s ~/dotfiles/.vimrc ~/.vimrc`
windows: `ln -s ~/dotfiles/.vimrc /usr/share/vim/.vimrc`

4. vimのインストール

Ubuntsu:
`sudo apt-get update`
`sudo apt-get install vim`

CentOS:
`sudo yum update`
`sudo yum install vim`

Mac:
`sudo brew update`
`sudo brew install vim`

5. NeoBundleInstallする

`$ vim ~/.vimrc`
`:NeoBundleInstall`
