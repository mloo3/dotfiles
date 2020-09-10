" helps prevent lag
set timeoutlen=1000
set ttimeoutlen=0
" enforces format
set encoding=utf-8
" smartcase search
set ignorecase
set smartcase
" highlight all isntances of word
set hlsearch
" change the no wordwrap
set wrap!
" remove whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e

noremap <F12> <Esc>:syntax sync fromstart<CR>

" nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

"yank to clipboard
set clipboard=unnamedplus

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
"===> Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree', {'on':'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'romainl/vim-cool'
Plug 'brgmnn/vim-opencl'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

" Plug 'flazz/vim-colorschemes'
" Plug 'vim-syntastic/syntastic'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme gruvbox
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"shortcut
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "===> coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocomplete
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()

if has ('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" goto next lint error
try
    nmap <silent> [c :call CocAction('diagnosticNext')<cr>
    nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "===> ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
