" Plugins

call plug#begin('~/.local/share/nvim/plugged')

" General
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
"  code completion. consider switching to YouCompleteMe
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tmhedberg/SimpylFold'
"  fuzzy find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Python
"Plug 'davidhalter/jedi-vim'
"Plug 'zchee/deoplete-jedi'
"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"Plug 'cjrh/vim-conda'

"Plug 'neomake/neomake'
"Plug 'dense-analysis/ale'

" Web
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Rust
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Neovide / Plugin Config

let g:neovide_scale_factor = 1
let g:neovide_transparency = 0.85
let g:neovide_floating_blur_amount_x = 5.0
let g:neovide_floating_blur_amount_y = 5.0

let g:SimpylFold_docstring_preview=1

let g:deoplete#enable_at_startup = 1

let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#environment_path = '/home/johnim/anaconda3/envs/sd2/bin/python'

let g:NERDTreeWinPos = 'right'

let g:fzf_preview_window = 'right:60%'
let g:fzf_action = {
    \ 'ctrl-h': 'vsplit',
    \ 'ctrl-v': 'split'
    \ }
augroup fzf
    autocmd!
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" General Settings

"  theme / appearance
colorscheme nightfly
syntax on
filetype on
filetype plugin on
filetype indent on
set t_Co=256
set guifont=Source\ Code\ Pro:h10
set termguicolors
set number
set cursorline

"  tabbing
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set expandtab

"  make line breaks traversable
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"  use system clipboard
set clipboard=unnamed
set clipboard+=unnamedplus

"  nerd shit / &c
set encoding=utf-8
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set updatetime=200
set history=1000
set backup
set ruler " column / row number
set showcmd
set showmode
set showmatch
set hlsearch
set incsearch
set wildmenu
set wildmode=list:longest
set foldmethod=indent
set foldlevel=99

" Highlighting

"  highlight spaces at end of line (when not in insert mode)
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/

" Keymapping

let mapleader = ","

"  enter insert mode directly from visual mode
vnoremap i <esc>i
"  copy from visual mode
vnoremap <c-c> "+y

"  ctrl+f to find files
nnoremap <c-f> :Files<cr>

"  alt+direction to move lines up/down
nnoremap <silent><m-j> mz:m+<return>`z
nnoremap <silent><m-k> mz:m-2<return>`z
"  & the same for multiple lines in visual mode
"  no idea how this works, took it from nori's dotfiles (https://nori.gay)
vnoremap <silent><m-j> :m'>+<return>`<my`>mzgv`yo`z
vnoremap <silent><m-k> :m'<-2<return>`>my`<mzgv`yo`z

"  same as above but for up/down instead of j/k
nnoremap <silent><m-down> mz:m+<return>`z
nnoremap <silent><m-up> mz:m-2<return>`z
vnoremap <silent><m-down> :m'>+<return>`<my`>mzgv`yo`z
vnoremap <silent><m-up> :m'<-2<return>`>my`<mzgv`yo`z

"  undo is ctrl-z i don't care that u is easier to press
nnoremap <c-z> u
"  and redo is ctrl-shift-z
nnoremap <c-s-z> <c-r>

"  undo current insert operation with ctrl-z
inoremap <c-z> <esc>ui
"  & redo with ctrl-shift-z
inoremap <c-s-z> <esc><c-r>i

"  paste in insert mode
inoremap <c-v> <esc>:set paste<return>a<c-r>+<esc>:set nopaste<return>a
"  paste in normal mode
nnoremap <c-v> :set paste<return>i<c-r>+<esc>:set nopaste<return>
"  jj to quickly exit insert
inoremap jj <esc>

"  cycle through completion options
inoremap <leader><tab> <c-n>
inoremap <leader><s-tab> <c-p>

"  ctrl+scroll & control+0 to adjust scale & reset to default
nnoremap <C-ScrollWheelDown> :let g:neovide_scale_factor *= 0.9<return>
nnoremap <C-ScrollWheelUp> :let g:neovide_scale_factor *= 1.11111111<return>
nnoremap <c-0> :let g:neovide_scale_factor = 1.0<return>

"  navigate to errors
nnoremap <leader>er :Semshi goto error<return>:Semshi error<return>
nnoremap <leader>rr :Semshi error<return>
nnoremap <leader>ss :Semshi toggle<return>
nnoremap <leader>re :Semshi rename<return>

"  back to previous place
nnoremap <leader>, ``

"  nerdtree - maybe make this a 2-key command instead of 3
nnoremap <silent><leader>nt :NERDTreeToggle<return>

"  some niceties for editing this file
nnoremap <leader>src :source ~/.config/nvim/init.vim<return>
nnoremap <leader>erc :e ~/.config/nvim/init.vim<return>
nnoremap <leader>plug :PlugInstall<return>

"  terminal & splitting
nnoremap <leader>tt :vsplit<return><c-w>l:terminal<return>i
nnoremap <leader>hh :vsplit<return><c-w>l
nnoremap <leader>vv :split<return><c-w>

"  folding
nnoremap <space> za

"  insert lines above/below without entering insert mode
nnoremap o o<esc>
nnoremap O O<esc>

"  center the cursor when jumping between search results
nnoremap n nzz
nnoremap N Nzz

"  search for tab to clear search results
nnoremap /<tab> :noh<return>

"  shift+direction to move between splits
nnoremap <s-j> <c-w>j
nnoremap <s-h> <c-w>h
nnoremap <s-k> <c-w>k
nnoremap <s-l> <c-w>l

"  ctrl+left/right to hop entire words at a time
nnoremap <c-l> <c-right>
nnoremap <c-h> <c-left>

"  ctrl+shift+right to hop to end of line
nnoremap <c-s-l> $
nnoremap <c-s-right> $

"  & similar for hopping to the start
nnoremap <c-s-h> ^
nnoremap <c-s-left> ^

"  maybe figure out how to make this terminal-mode only; makes ctrl-c work in
"  normal mode
nnoremap <c-c> i<c-c><esc>

"  exit the terminal the same way as exiting insert mode
tnoremap <esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

"  quick quit
nnoremap <leader>q :q<return>
"  just close the whole damn editor
nnoremap <leader>qqq :qa!<return>

"  ctrl-s is save, of course
nnoremap <C-s> :w<return>
inoremap <c-s> <esc>:w<return>li

" Goyo
nnoremap <silent><leader>zen :Goyo<return>

function! IntoZen()
    setlocal linebreak
    :Limelight
    "  navigate by actual position on screen instead of by row/column
    nnoremap <buffer> j gj
    nnoremap <buffer> k gk
    nnoremap <buffer> $ g$
    nnoremap <buffer> ^ g^
    inoremap <buffer> . .<c-g>u
    inoremap <buffer> ! !<c-g>u
    inoremap <buffer> ? ?<c-g>u
    inoremap <buffer> , ,<c-g>u
    inoremap <buffer> ; ;<c-g>u
    inoremap <buffer> : :<c-g>u
endfunction

function! ExitZen()
    setlocal nolinebreak
    :Limelight!
    unmap <buffer> j
    unmap <buffer> k
    unmap <buffer> $
    unmap <buffer> ^
    iunmap <buffer> .
    iunmap <buffer> !
    iunmap <buffer> ?
    iunmap <buffer> ,
    iunmap <buffer> ;
    iunmap <buffer> :
endfunction

autocmd! User GoyoEnter nested call IntoZen()
autocmd! User GoyoLeave nested call ExitZen()


" Without this line, search results get highlighted whenever I source the file
:noh

