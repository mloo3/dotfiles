" helps prevent lag
set timeoutlen=1000
set ttimeoutlen=0
" enforces format 
set encoding=utf-8
" smartcase search
set ignorecase
set smartcase
noremap <F12> <Esc>:syntax sync fromstart<CR>

" nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> TABS AND SPACE 4 INDENTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""filetype plugin indent on 
""" show existing tab with 4 spaces width
""set tabstop=4
""" when indenting with '>', use 4 spaces width
""set shiftwidth=4
""" On pressing tab, insert 4 spaces
""set expandtab
""set softtabstop=4

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
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree', {'on':'NERDTreeToggle' }
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'romainl/vim-cool'
Plug 'brgmnn/vim-opencl'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> NERDTree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"shortcut
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Shortcuts 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap { {<CR>}<Esc>k$a
" $TERM=xterm-256color

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> zfz 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ackprg = 'ag --vimgrep --smart-case'                                                   
" cnoreabbrev ag Ack                                                                           
" cnoreabbrev aG Ack                                                                           
" cnoreabbrev Ag Ack                                                                           
" cnoreabbrev AG Ack  
" if executable('ag')
" 	  let g:ackprg = 'ag --vimgrep'
"   endif
