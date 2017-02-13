#!/bin/bash

echo "Setting up zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc

echo "Setting up vim"
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "Setting up tmux"
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Setting up git"
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
cp ~/dotfiles/git/.gitconfig.user.template ~/.gitconfig.user

echo "Done! Don't forget to edit ~/.gitconfig.user"
