#!/bin/bash

# git clone this repository into ~/.vim/vimrcs

# install vim-plug
echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ $? -eq 0 ]; then
  echo "Installed vim-plug sucessfully"
else
  echo "Failed to install vim-plug"
  exit 1
fi

# copy .vimrc
cp ~/.vim/vimrcs/.vimrc ~/.vimrc

# install plugins
echo "Installing plugins..."
vim +PlugInstall +qa
if [ $? -eq 0 ]; then
  echo "Installed plugins sucessfully"
else
  echo "Failed to install plugins"
  exit 2
fi

# copy colorscheme
# cp -r ~/.vim/plugged/tomorrow-theme/vim/colors ~/.vim
mkdir ../colors
cp ~/.vim/plugged/gruvbox/colors/gruvbox.vim ~/.vim/colors/
cp ~/.vim/plugged/peaksea/colors/peaksea.vim ~/.vim/colors/
cp ~/.vim/plugged/molokai/colors/molokai.vim ~/.vim/colors/
cp ~/.vim/plugged/vim-solarized8/colors/* ~/.vim/colors/

if [ $? -eq 0 ]; then
  echo "Installed sucessfully! Enjoy-:)"
else
  echo "Failed to install"
  exit 2
fi
