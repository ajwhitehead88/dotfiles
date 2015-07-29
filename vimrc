" VIMRC
set nocompatible

" vim-plug
call plug#begin()

" Plug 'majutsushi/tagbar'
" Plug 'mhinz/vim-signify'
" Plug 'scrooloose/syntastic'
Plug 'OrangeT/vim-csharp'
Plug 'Shougo/neocomplcache'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'closetag.vim', { 'for': [ 'html', 'xml', 'xsl' ] }
Plug 'elzr/vim-json'
Plug 'freeo/vim-kalisi'
Plug 'gorodinskiy/vim-coloresque'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nosami/Omnisharp', { 'for': 'cs' }
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
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

set splitbelow

set nolist
set listchars=tab:».,trail:·,extends:#,nbsp:·

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

" indent guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=5

" airline
let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline_theme='solarized'
let g:airline_powerline_fonts=0
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#branch#enabled=1

" neocompcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=1
let g:neocomplete#enable_smart_case=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_min_syntax_length=0
let g:neocomplcache_enable_auto_close_preview=0

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
let g:neocomplcache_omni_patterns.cs = '.*'

let g:OmniSharp_timeout = 1

" Get Code Issues and syntax errors for CS files
let g:syntastic_cs_checkers=['syntax', 'semantic', 'issues']

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

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint', 'jshint', 'jslint']

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
