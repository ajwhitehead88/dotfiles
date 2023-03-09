" VIMRC
set nocompatible

" vim-plug
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'alvan/vim-closetag'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gko/vim-coloresque'
Plug 'hail2u/vim-css3-syntax', { 'for': ['css']}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'neomake/neomake'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'mengelbrecht/lightline-bufferline'
  " Plug 'shaunsingh/nord.nvim'
else
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'scrooloose/syntastic'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-dispatch'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-shell'
  " Plug 'nordtheme/vim'
endif
Plug 'nordtheme/vim'

call plug#end()

runtime macros/matchit.vim

set mouse=a
set cmdheight=2
set laststatus=2
set ruler
set showmode
set modeline
set showtabline=2
set noshowmode
set showcmd
set relativenumber
set number
set cursorline
set scrolloff=3
set sidescroll=5
set sidescrolloff=5
set wmh=0
set previewheight=5
set selection=inclusive
set updatetime=500
set lazyredraw
set nowrap

if has('win32')
  if !has('nvim')
    set term=win32
  endif
  set directory=~/vimfiles/tmp
else
  if !has('nvim')
    set term=screen-256color
  endif
  set directory=/tmp
endif

set encoding=utf-8
set termencoding=utf-8
set shell=/bin/zsh
set visualbell
set history=500
set hidden

set nobackup
set nowritebackup

set wildmode=list:longest,full " Better completion
set wildignore=*.svn,*.git,*\\tmp\\*,*.swp,*.zip,*.exe
set completeopt=longest,menuone,preview
set pastetoggle=<F4>

set autoindent
set expandtab
set copyindent
set preserveindent
set linebreak
set softtabstop=0
set shiftwidth=2
set tabstop=2
set shiftround

set incsearch
set ignorecase
set smartcase
set hlsearch

set backspace=indent,eol,start
set showmatch

set splitbelow

set list
set listchars=tab:»\ ,trail:·

set diffopt=vertical,filler

" Change directory on BufEnter
autocmd BufEnter * silent! lcd %:p:h

" Completions
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"

set omnifunc=syntaxcomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript,jsx setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" bindings
let mapleader=" "

" sudo save
cmap w!! w !sudo tee % >/dev/null

" Unmap annoying keys
nmap q: <Nop>
nmap q/ <Nop>
nmap q? <Nop>

" Ctrl-s save
imap <C-s> <esc>:w<cr>
nmap <C-s> :w<cr>

" navigate tabs
map  <C-Tab> :tabnext <CR>
imap <C-Tab> <ESC> :tabnext <CR>
map  <C-S-Tab> :tabprevious <CR>
imap <C-S-Tab> <ESC> :tabprevious <CR>

" Navigate splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" size splts
map - <C-W>-
map + <C-W>+

" Y like other capitals
nnoremap Y y$

" copy and paste
nmap <C-Insert> "+yy
imap <C-Insert> <ESC>"+yy
nmap <S-Insert> "+p
imap <S-Insert> <ESC>"+p

" navigate buffers
nmap <F1> :bprev<CR>
nmap <F2> :bnext<CR>
imap <F1> <ESC>:bprev<CR>
imap <F2> <ESC>:bnext<CR>

" closetag
let g:closetag_html_style=1
autocmd FileType html let b:closetag_html_style=1

" netrw
nmap <Leader>f :Ex<CR>
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_altv=1
let g:netrw_preview=1

nmap <Leader>p :CtrlPMRU<CR>
nmap <Leader>. :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>t :CtrlPBufTag<CR>

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|\.svn|node_modules|dist)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links'
      \ }

" sort lines
nmap <Leader>so :%!sort -u<CR>

" toggle spelling
nmap <Leader>sp :set spell!<CR>

" toggle wrapping
nmap <Leader>wr :set wrap!<CR>

" remove search highlighting
nmap <Leader>hl :set nohls<CR>

" toggle list chars
nmap <Leader>li :set list!<CR>

" convert line endings
nmap <Leader>le :%s/\r/\r/g<CR>

" strip whitespace
autocmd BufWritePre * :%s/\s\+$//e

nmap <Leader>ss :call StripTrailingWhitespace()<CR>
function! StripTrailingWhitespace()
  %s/[ \t]\+$//ge
  %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfunction

lua << EOF
  require('gitsigns').setup {}
  require('lspconfig').tsserver.setup {}

  vim.g['lightline'] = {
    colorscheme = 'one',
    active = {
      left = {{'mode', 'paste'}, {'readonly', 'filename', 'modified'}}
    },
    tabline = {
      left = {{'buffers'}},
      right = {{'close'}}
    },
    component_expand = {
      buffers = 'lightline#bufferline#buffers'
    },
    component_type = {
      buffers = 'tabsel'
    }
  }
EOF

if has('nvim')
  call neomake#configure#automake('nrwi', 500)

else
  " syntastic
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
endif

" Windows only stuff
if has("win32")
  behave mswin
  set columns=140
  set lines=40
  set winaltkeys=yes

  if !has("gui_running")
    if !has('nvim')
      set term=xterm
    endif
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
  endif

	set shell=C:\Windows\system32\cmd.exe
endif

if has('nvim')
  set termguicolors
else
	set guioptions=
  set guifont=Hack:h10
endif

colorscheme nord
set background=dark
