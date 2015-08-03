" VIMRC
set nocompatible

" vim-plug
call plug#begin()

" Plug 'Shougo/neocomplcache'
" Plug 'airblade/vim-gitgutter'
" Plug 'majutsushi/tagbar'
" Plug 'nosami/Omnisharp', { 'for': 'cs' }
" Plug 'scrooloose/syntastic'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-speeddating'
Plug 'OrangeT/vim-csharp'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'cakebaker/scss-syntax.vim'
Plug 'closetag.vim', { 'for': [ 'html', 'xml', 'xsl', 'html.handlebars', 'html.mustache', 'cshtml' ] }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'freeo/vim-kalisi'
Plug 'gorodinskiy/vim-coloresque'
Plug 'hail2u/vim-css3-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'

call plug#end()

runtime macros/matchit.vim

set mouse=a
set cmdheight=2         " command line height
set laststatus=2        " occasions to show status line, 2=always.
set ruler               " ruler display in status line
set showmode            " show mode at bottom of screen
set modeline
set showcmd
set relativenumber      " show line numbers
set number              " show line numbers
set cursorline
set scrolloff=3         " Scroll when 3 lines from the edge
set sidescroll=5        " Scroll 5 chars when moving off the right
set sidescrolloff=5     " Scroll when 5 chars from the edge
set wmh=0
set previewheight=5
set selection=inclusive
set updatetime=500

if has("win32")
    set term=win32
    set directory=~/vimfiles/tmp
else
	set term=screen-256color
    set directory=/tmp
endif

set encoding=utf-8
set termencoding=utf-8
set shell=/bin/zsh
set vb
set t_vb=
set t_Co=256
set history=500         " 100 lines of command line history
set hidden

set nobackup            " disable backup files (filename~)
set nowritebackup

set nowrap
set lbr

set wildmode=list:longest,full " Better completion
set wildignore=*.svn,*.git,*\\tmp\\*,*.swp,*.zip,*.exe
set completeopt=longest,menuone,preview
set pastetoggle=<F4>

set autoindent          " auto indents next new line
" set smartindent         " intelligent indenting -- DEPRECATED by cindent
set noexpandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set shiftround

set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search
set hls

set backspace=indent,eol,start
set showmatch           " show matching brackets (),{},[]

set splitbelow

set list
set listchars=tab:»\ ,trail:·

set diffopt=vertical,filler

" Completions
set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
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
for n in range(1, 9)
    exe "nmap <Leader>".n." <ESC>:buffer ".n."<CR>"
endfor

" vim-json
let g:vim_json_syntax_conceal=0

" closetag
let g:closetag_html_style=1 
autocmd FileType html let b:closetag_html_style=1

"CtrlP

if has('python')
	let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

nmap <Leader>p :CtrlPMRU<CR>
nmap <Leader>. :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>t :CtrlPBufTag<CR>

let g:ctrlp_custom_ignore={
  \ 'dir':  '\v[\/]\.(git|svn)$',
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
nmap <Leader>ss :call StripTrailingWhitespace()<CR>
function! StripTrailingWhitespace()
    %s/[ \t]\+$//ge
    %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfunction

" airline
let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline_theme='solarized'
let g:airline_powerline_fonts=0
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#branch#enabled=1

" Windows only stuff
if has("win32")
	behave mswin
	set columns=140
	set lines=40
	set winaltkeys=yes

	" Session stuffs
	"set sessionoptions-=resize,winpos
	" au GUIEnter * simalt ~x
	"autocmd VIMEnter * :source $HOME/vimfiles/session.vim
	"autocmd VIMLeave * :mksession! $HOME/vimfiles/session.vim

	set shell=C:\Windows\system32\cmd.exe
endif

set guioptions=
set guifont=Envy\ Code\ R:h10

colorscheme kalisi
let g:airline_theme='kalisi'
set background=dark
