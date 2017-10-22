" подключаем ещё настройки
source ~/.pro100-vim/plugins.vim
source ~/.pro100-vim/mapping.vim
"
"
""""""""""""""""""""""""""""""""""""""""""""""""
"
" включаем нумерацию строк
set number

" включаем управление мышкой
set mouse=a

" включаем цветовую тему gruvbox
colorscheme gruvbox

" положение сайдбара nerdtree
let NERDTreeWinPos = "left"
" автооткрытие nerdtree при открытии вима
"autocmd vimenter * NERDTree

" emmet 
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


