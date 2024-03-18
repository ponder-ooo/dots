" Disable vi compat; dunno why
set nocompatible

filetype on

filetype plugin on

filetype indent on

syntax on

set number

set cursorline

set shiftwidth=4

set tabstop=4

set expandtab

set showcmd

set showmode

set showmatch

set hlsearch

set history=1000

set wildmenu

set wildmode=list:longest

let g:SimpylFold_docstring_preview=1

" Plugins --- {{{

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'cjrh/vim-conda'
Plug 'tmhedberg/SimpylFold'

call plug#end()

" }}}

" Mappings --- {{{

nnoremap <leader>src :source ~/.vimrc<return>

inoremap jj <esc>

let mapleader = ","

if has ("xterm_clipboard")
    vnoremap <c-c> "+y
    inoremap <c-v> <esc>"+p i
else
    vnoremap <c-c> :!xclip -f -sel -clip <return>
    inoremap <c-v> <esc>:r!xclip -o -sel clip <return>
endif

inoremap <c-z> <esc>u i
nnoremap <c-o> u

nnoremap <leader>, ``
nnoremap <leader>nt :NERDTreeToggle<return>

set foldmethod=indent
set foldlevel=99
nnoremap <space> za

nnoremap o o<esc>
nnoremap O O<esc>

nnoremap n nzz
nnoremap N Nzz
nnoremap <leader>/ :noh<return>

nnoremap <s-j> <c-w>j
nnoremap <s-h> <c-w>h
nnoremap <s-k> <c-w>k
nnoremap <s-l> <c-w>l

" }}}

" Vimscript --- {{{

" Enable code folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Status Line --- {{{

set statusline=

set statusline+=\ %F\ (%Y)\ %M\ %R

set statusline+==%=

set statusline+=\ ascii:\ %b\ (0x%B)\ line:\ %l\ pos:\ %c\ %p%%

set laststatus=2

" }}}

