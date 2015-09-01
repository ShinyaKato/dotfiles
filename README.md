# 設定
1. git clone https://github.com/ShinyaKato/dotfiles.git ~/dotfiles
2. git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/vimfiles/vundle.vim.git
3. .vimrcをおくべき場所に~/dotfiles/.vimrcへのシンボリックリンクを作成
   linux) ln -s ~/dotfiles/.vimrc ~/.vimrc
   windows) ln -s ~/dotfiles/.vimrc /usr/share/vim/.vimrc