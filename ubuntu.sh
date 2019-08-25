# clone this repository
git clone https://github.com/ShinyaKato/dotfiles.git ~/dotfiles

# install ag
sudo apt install -y silversearcher-ag

# install ctags and gtags
sudo apt install -y exuberant-ctags
sudo apt install -y global
sudo apt install -y python3-pip
pip3 install --user pynvim

# install dein.nvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s ~/.vim/dein

# create symbolic link
ln -s ~/dotfiles/.vimrc ~/.vimrc
