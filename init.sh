#!/bin/bash

NAME_ULTIMATE_VIMRC="The Ultimate vimrc"
ULTIMATE_VIMRC="$HOME/.vim_runtime"

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
        git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime
        sh $HOME/.vim_runtime/install_awesome_vimrc.sh
        python $HOME/.vim_runtime/update_plugins.py
    else
        exit 1
    fi
# если не нашли то клонируем и запускаем
else
    git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime
    sh $HOME/.vim_runtime/install_awesome_vimrc.sh
fi

# дописываем в .vimrc строчку подключения pro100-vim
echo "
\"подключаем pro100-vim config
source ~/.pro100-vim/vimrc.vim
source ~/.pro100-vim/mapping.vim
source ~/.pro100-vim/plugins.vim" >> $HOME/.vimrc

# вот и сказочке конец
echo "Вуаля!"
echo "Конфиг vim успешно установлен"
