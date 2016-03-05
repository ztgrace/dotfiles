#!/bin/bash

CWD=$(pwd)

git submodule update --init --recursive

ln -is $CWD/.bashrc $HOME
ln -is $CWD/.dir_colors $HOME
ln -is $CWD/.gdbinit $HOME
ln -is $CWD/.inputrc $HOME
ln -is $CWD/.net-stats.sh $HOME
ln -is $CWD/.radarerc $HOME
ln -is $CWD/.tmux.conf $HOME
ln -is $CWD/.vim $HOME
ln -is $CWD/.vimrc $HOME
ln -is $CWD/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/
