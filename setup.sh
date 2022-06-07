#!/bin/bash

BoldRed="\033[1;31m"
ColorReset="\033[0m"

echo -e "${BoldRed}Setting up zsh${ColorReset}"
git clone git@github.com:ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
chsh -s /bin/zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

echo -e "\n${BoldRed}Setting up vim${ColorReset}"
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

echo -e "\n${BoldRed}Setting up tmux${ColorReset}"
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo -e "\n${BoldRed}Setting up git${ColorReset}"
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
cp ~/dotfiles/git/.gitconfig.user.template ~/.gitconfig.user

echo -e "\n${BoldRed}Done! Don't forget to edit ~/.gitconfig.user${ColorReset}"
