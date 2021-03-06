" VIMRC
set nocompatible

" vim-plug
call plug#begin()

if has('nvim') && has('python3')
    Plug 'Shougo/deoplete.nvim'
elseif has('lua')
    Plug 'Shougo/neocomplete'
endif
" Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs', 'do': './omnisharp-roslyn/build.sh' }
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'OrangeT/vim-csharp'
Plug 'PProvost/vim-ps1'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'cakebaker/scss-syntax.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-scripts/closetag.vim', { 'for': [ 'html', 'xml', 'xsl', 'html.handlebars', 'html.mustache', 'cshtml' , 'jsx' ] }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'gko/vim-coloresque'
Plug 'hail2u/vim-css3-syntax', { 'for': ['css']}
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/html5.vim', { 'for': [ 'html', 'html.handlebars', 'html.mustache' ] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown', { 'for': [ 'markdown' ] }
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
if !has('nvim')
    Plug 'tpope/vim-dispatch'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-shell'
endif

call plug#end()

runtime macros/matchit.vim

set mouse=a
set cmdheight=2
set laststatus=2
set ruler
set showmode
set modeline
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
set shiftwidth=4
set tabstop=4
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

" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
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

" neocomplete / deoplete
if has('nvim')
    let g:deoplete#enable_at_startup=1
    let g:deoplete#ignore_case=1
    let g:deoplete#enable_smart_case=1
elseif has('lua')
    let g:acp_enableAtStartup=0
    let g:neocomplete#enable_at_startup=1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 2
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
endif

" vim-json
let g:vim_json_syntax_conceal=0

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

"CtrlP
if has('python')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

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

" indent guides
let g:indent_guides_enable_on_vim_startup=1

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_sass_checkers=['scss_lint']
let g:syntastic_scss_checkers=['scss_lint']
let g:syntastic_css_checkers=['csslint']
let g:syntastic_sass_scss_lint_args='-x Indentation'
let g:syntastic_scss_scss_lint_args='-x Indentation'
let g:syntastic_cs_checkers = ['code_checker']

autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

" jsx
let g:jsx_ext_required = 0

" airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts=0

let g:airline_extensions = ['branch', 'tabline'] ", 'syntastic']

let g:airline#extensions#branch#enabled=1

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#buffer_nr_show=0
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#buffer_min_count=0
let g:airline#extensions#tabline#fnamemod=':t'

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"OmniSharp
"let g:OmniSharp_selector_ui = 'ctrlp'"
"let g:OmniSharp_server_type = 'roslyn'
"
"augroup omnisharp_commands
"    autocmd!
"
"    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
"    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
"
"    " Builds can also run asynchronously with vim-dispatch installed
"    autocmd FileType cs nnoremap <leader>ob :wa!<cr>:OmniSharpBuildAsync<cr>
"
"    " Automatically add new cs files to the nearest project on save
"    autocmd BufWritePost *.cs call OmniSharp#AddToProject()
"
"    "show type information automatically when the cursor stops moving
"    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
"
"    "The following commands are contextual, based on the current cursor position.
"    autocmd FileType cs nnoremap <leader>ogd :OmniSharpGotoDefinition<cr>
"    autocmd FileType cs nnoremap <leader>ofi :OmniSharpFindImplementations<cr>
"    autocmd FileType cs nnoremap <leader>oft :OmniSharpFindType<cr>
"    autocmd FileType cs nnoremap <leader>ofs :OmniSharpFindSymbol<cr>
"    autocmd FileType cs nnoremap <leader>ofu :OmniSharpFindUsages<cr>
"
"    "finds members in the current buffer
"    autocmd FileType cs nnoremap <leader>ofm :OmniSharpFindMembers<cr>
"
"    " cursor can be anywhere on the line containing an issue
"    autocmd FileType cs nnoremap <leader>ox  :OmniSharpFixIssue<cr>
"    autocmd FileType cs nnoremap <leader>ofx :OmniSharpFixUsings<cr>
"    autocmd FileType cs nnoremap <leader>ott :OmniSharpTypeLookup<cr>
"    autocmd FileType cs nnoremap <leader>odc :OmniSharpDocumentation<cr>
"
"    "navigate up by method/property/field
"    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
"    "navigate down by method/property/field
"    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
"
"    " Contextual code actions (requires CtrlP or unite.vim)
"    autocmd FileType cs nnoremap <leader>oca :OmniSharpGetCodeActions<cr>
"
"    " Run code actions with text selected in visual mode to extract method
"    autocmd FileType cs vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
"
"    " rename with dialog
"    autocmd FileType cs nnoremap <leader>onm :OmniSharpRename<cr>
"    " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
"    autocmd FileType cs command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
"
"    " Force OmniSharp to reload the solution. Useful when switching branches etc.
"    autocmd FileType cs nnoremap <leader>orl :OmniSharpReloadSolution<cr>
"    autocmd FileType cs nnoremap <leader>ocf :OmniSharpCodeFormat<cr>
"
"    " Load the current .cs file to the nearest project
"    autocmd FileType cs nnoremap <leader>otp :OmniSharpAddToProject<cr>
"
"    " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
"    autocmd FileType cs nnoremap <leader>oss :OmniSharpStartServer<cr>
"    autocmd FileType cs nnoremap <leader>osp :OmniSharpStopServer<cr>
"
"    " Add syntax highlighting for types and interfaces
"    nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"augroup END

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

    " Session stuffs
    "set sessionoptions-=resize,winpos
    " au GUIEnter * simalt ~x
    "autocmd VIMEnter * :source $HOME/vimfiles/session.vim
    "autocmd VIMLeave * :mksession! $HOME/vimfiles/session.vim

	set shell=C:\Windows\system32\cmd.exe
endif

if has('nvim')
    set termguicolors
else
	set guioptions=
    set guifont=Envy\ Code\ R:h10
endif

colorscheme onedark
set background=dark
