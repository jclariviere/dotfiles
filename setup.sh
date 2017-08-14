#!/bin/bash

echo "Setting up zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

echo "Setting up vim"
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

echo "Setting up tmux"
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Setting up git"
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
cp ~/dotfiles/git/.gitconfig.user.template ~/.gitconfig.user

echo "Done! Don't forget to edit ~/.gitconfig.user"
