#!/bin/bash

FOLDER_VIM_AWESOME="$HOME/.vim_runtime"


if [ -d $FOLDER_VIM_AWESOME ]
then
    echo "Вай вай... А я нашел установленный The Ultimate vimrc.. Удалить и заново преустановить[y/n]?"
    read DEL_VIM_AWESOME

	if [ $DEL_VIM_AWESOME = "y" ]
	then
        rm -rf $FOLDER_VIM_AWESOME
        git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime
        sh $HOME/.vim_runtime/install_awesome_vimrc.sh
	else
        exit 1
	fi
fi

echo "
\"include pro100-vim config
source $HOME/.pro100-vim/.vimrc" >> $HOME/.vimrc
