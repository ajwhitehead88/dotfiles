" VUNDLE
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'OrangeT/vim-csharp'
Bundle 'Townk/vim-autoclose'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'closetag.vim'
Bundle 'ervandew/supertab'
Bundle 'groenewege/vim-less'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kien/ctrlp.vim'
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'nosami/Omnisharp'
Bundle 'scrooloose/syntastic'
Bundle 'skammer/vim-css-color.git'
Bundle 'surround.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/pyte'

" VIMRC
set nocompatible

syntax on
filetype plugin indent on

set mouse=a
set cmdheight=1         " command line height
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

if has("win32")
    set term=win32
else
	set term=zsh
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
set autowrite
set writebackup
set backup
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/tmp

set nowrap
set lbr

set wildmode=list:longest,full " Better completion
set wildignore=*.svn,*.git,*\\tmp\\*,*.swp,*.zip,*.exe  " Ignore VCS files"
set completeopt=longest,menuone,preview
set noshowmatch
set pastetoggle=<F4>

set autoindent          " auto indents next new line
set smartindent         " intelligent indenting -- DEPRECATED by cindent
set expandtab           " insert spaces instead of tab chars
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

set nolist
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set diffopt=vertical,filler

" Completions
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType cs set omnifunc=OmniSharp#Complete

" bindings
let mapleader = "`"

" sudo save
cmap w!! w !sudo tee % >/dev/null

" Navigate wrapped lines with j and k
nmap j gj
nmap k gk
vmap j gj
vmap k gk

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
nmap <Leader>bp :bprev<CR>
nmap <Leader>bn :bnext<CR>

" closetag
let g:closetag_html_style=1 
autocmd FileType html let b:closetag_html_style=1
:au Filetype html,xml,xsl source ~/.vim/bundle/closetag.vim/plugin/closetag.vim 

"CtrlP
nmap <Leader>p :CtrlPMRU<CR>
nmap <Leader>n :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
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

" convert to DOS
nmap <Leader>td :e ++ff=dos<CR>

" strip whitespace
nmap <f5> :call StripTrailingWhitespace()<CR>
nmap <Leader>ss :call StripTrailingWhitespace()<CR>
function! StripTrailingWhitespace()
    %s/[ \t]\+$//ge
    %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfunction

" minibufexpl
let g:miniBufExplTabWrap = 1
let g:miniBufExplMaxSize = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" indent guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 5

" airline
let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline_theme='solarized'
let g:airline_powerline_fonts=0
let g:airline#extensions#bufferline#enabled = 1

" OMNISHARP
" Get Code Issues and syntax errors for CS files
let g:syntastic_cs_checkers = ['syntax', 'issues']
autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

"show type information automatically when the cursor stops moving
autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

" Contextual code actions (requires CtrlP)
autocmd FileType cs nnoremap <leader><space> :OmniSharpGetCodeActions<cr>

" rename with dialog
autocmd FileType cs nnoremap <leader>rr :OmniSharpRename<cr>

" Synchronous build (blocks Vim)
"autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>

" Builds can also run asynchronously with vim-dispatch installed
autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuildAsync<cr>

" Windows only stuff
if has("win32")
	behave mswin
	set columns=140
	set lines=40
	set winaltkeys=yes
	set go-=T

	nmap j j
	nmap k k
	vmap j j
	vmap k k

	" Session stuffs
	"set sessionoptions-=resize,winpos
	au GUIEnter * simalt ~x
	"autocmd VIMEnter * :source $HOME/vimfiles/session.vim
	"autocmd VIMLeave * :mksession! $HOME/vimfiles/session.vim

	set backupdir=$HOME\.vim\backup
	set directory=$HOME\.vim\tmp
	set shell=C:\Windows\system32\cmd.exe

endif

set guifont=Envy\ Code\ R:h10

colorscheme pyte
