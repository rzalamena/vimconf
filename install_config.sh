#!/bin/sh
CURDIR=`pwd`

# create backups, for blind sighted users that doesnt even look what
# scripts does
mv -f ~/.vimrc ~/.vimrc.bk
mv -f ~/.gvimrc ~/.gvimrc.bk
mv -f ~/.vim ~/.vim.bk

# create simlinks for the current dir, so our configuration is updated
# if its modified in the git repository
ln -sf ${CURDIR}/vimrc ~/.vimrc
ln -sf ${CURDIR}/gvimrc ~/.gvimrc
ln -sf ${CURDIR}/vim ~/.vim
