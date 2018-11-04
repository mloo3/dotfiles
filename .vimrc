""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> TABS AND SPACE 4 INDENTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on 
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Line Numbering 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber

function! g:ToggleNuMode()
    if(&nu == 1 && &rnu==1)
        set nornu
        set nu
    else
        set nu
        set rnu
    endif
endfunc

nnoremap <silent><C-l> :call g:ToggleNuMode()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Colors and Fonts 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme gruvbox
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', {'on':'NERDTreeToggle' }
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> NERDTree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"shortcut
map <C-n> :NERDTreeToggle<CR>

