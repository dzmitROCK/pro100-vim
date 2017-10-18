#!/bin/bash

NAME_ULTIMATE_VIMRC="The Ultimate vimrc"
ULTIMATE_VIMRC="$HOME/.vim_runtime"
VUNDLE_DIRECTORY="$HOME/.vim/bundle/"

function get_install_ultimate_vim(){
    git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime
    sh $HOME/.vim_runtime/install_awesome_vimrc.sh
    echo "устанавливаем Vundle"
    if [ -d VUNDLE_DIRECTORY ]
    then
        rm -rf VUNDLE_DIRECTORY
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    else
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
}
# проверка на существование каталога The Ultimate vimrc
if [ -d $ULTIMATE_VIMRC ]
# если нашли то жалуемся
then
    echo "Вай вай... А я нашел установленный $NAME_ULTIMATE_VIMRC.."
    echo "Удалить и заново преустановить $NAME_ULTIMATE_VIMRC?[y/n]"

    # спрашиваем о переустановке The Ultimate vimrc
    read DEL_VIM_AWESOME

    # если ответ y
	if [ $DEL_VIM_AWESOME = "y" ]
    # то удаляем папку, клонируем репозиторий и запускаем скрипт
	then
        rm -rf $ULTIMATE_VIMRC
        get_install_ultimate_vim
    else
        exit 1
    fi
# если не нашли то клонируем и запускаем

else
    get_install_ultimate_vim
fi

# дописываем в .vimrc строчку подключения pro100-vim
touch ~/.vim_runtime/my_configs.vim
echo "
\"подключаем pro100-vim config
source ~/.pro100-vim/vimrc.vim" >> $HOME/.vim_runtime/my_configs.vim

# спросим про обновление плагнов
echo "Обновить плагины?[y/n]"
read UPDATE_PLUGINS
if [ $UPDATE_PLUGINS = "y" ]
then
    python $HOME/.vim_runtime/update_plugins.py
fi
# вот и сказочке конец
echo "Вуаля!"
echo "Конфиг vim успешно установлен"
