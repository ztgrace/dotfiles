#!/bin/bash

CWD=$(pwd)

ln -is $CWD/.bashrc $HOME
ln -is $CWD/.gdbinit $HOME
ln -is $CWD/.net-stats.sh $HOME
ln -is $CWD/.tmux.conf $HOME
ln -is $CWD/.vim $HOME
ln -is $CWD/.vimrc $HOME
ln -is $CWD/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/
