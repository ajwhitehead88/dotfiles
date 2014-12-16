" VIMRC
set nocompatible

" VUNDLE
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'OrangeT/vim-csharp'
Plugin 'Shougo/neocomplcache'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'closetag.vim'
Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'freeo/vim-kalisi'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-signify'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nosami/Omnisharp'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'skammer/vim-css-color'
Plugin 'surround.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'

call vundle#end()

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
set updatetime=500

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
set wildignore=*.svn,*.git,*\\tmp\\*,*.swp,*.zip,*.exe
set completeopt=longest,menuone,preview
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
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" bindings
let mapleader = " "

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
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links'
"   \ }

" Tagbar
nmap <Leader>tb :TagbarToggle<CR>

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
nmap <Leader>ss :call StripTrailingWhitespace()<CR>
function! StripTrailingWhitespace()
    %s/[ \t]\+$//ge
    %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfunction

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
let g:airline#extensions#branch#enabled = 1

" neocompcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <C-h>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

if !exists('g:neocomplcache_omni_patterns') 
    let g:neocomplcache_omni_patterns = {} 
endif 

" OMNISHARP
" Get Code Issues and syntax errors for CS files
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

" Show type information automatically when the cursor stops moving
autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

" Contextual code actions (requires CtrlP)
autocmd FileType cs nnoremap <leader>oo<space> :OmniSharpGetCodeActions<cr>

" Run code actions with text selected in visual mode to extract method
autocmd FileType cs vnoremap <leader>oo<space> :call OmniSharp#GetCodeActions('visual')<cr>

" Builds can also run asynchronously with vim-dispatch installed
autocmd FileType cs nnoremap <leader>ob :wa!<cr>:OmniSharpBuildAsync<cr>

" rename with dialog
autocmd FileType cs nnoremap <leader>or :OmniSharpRename<cr>

" Automatically add new cs files to the nearest project on save
autocmd BufWritePost *.cs call OmniSharp#AddToProject()

" Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" The following commands are contextual, based on the current cursor position.
autocmd FileType cs nnoremap <leader>ogd :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap <leader>ofi :OmniSharpFindImplementations<cr>
autocmd FileType cs nnoremap <leader>oft :OmniSharpFindType<cr>
autocmd FileType cs nnoremap <leader>ofs :OmniSharpFindSymbol<cr>
autocmd FileType cs nnoremap <leader>ofu :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap <leader>ofm :OmniSharpFindMembers<cr>

" Cursor can be anywhere on the line containing an issue 
autocmd FileType cs nnoremap <leader>ox  :OmniSharpFixIssue<cr>  
autocmd FileType cs nnoremap <leader>ofx :OmniSharpFixUsings<cr>
autocmd FileType cs nnoremap <leader>ott :OmniSharpTypeLookup<cr>
autocmd FileType cs nnoremap <leader>odc :OmniSharpDocumentation<cr>

" Navigate methods and properties
autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr> "navigate up by method/property/field
autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr> "navigate down by method/property/field

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
	" au GUIEnter * simalt ~x
	"autocmd VIMEnter * :source $HOME/vimfiles/session.vim
	"autocmd VIMLeave * :mksession! $HOME/vimfiles/session.vim

	set backupdir=$HOME\.vim\backup
	set directory=$HOME\.vim\tmp
	set shell=C:\Windows\system32\cmd.exe

endif

set guifont=Envy\ Code\ R:h10

colorscheme kalisi
let g:airline_theme='kalisi'
set background=light
