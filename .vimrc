set guifont=Iosevka\ Term\ Medium\ 9
set directory=.,$TEMP
set nocompatible
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
filetype plugin indent on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let hostname=system('hostname -s')

call plug#begin('~/.vim/plugged')
" From vimawesome.com
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
if hostname == 'deepthought'
    Plug 'valloric/youcompleteme'
else
    Plug 'ajh17/vimcompletesme'     " VimL completion
    Plug 'vim-scripts/AutoComplPop'
endif
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'sjl/gundo.vim'
Plug 'klen/python-mode'
Plug 'webdevel/tabulous'
Plug 'chriskempson/base16-vim'
Plug 'rkitover/vimpager'
Plug 'will133/vim-dirdiff'
Plug 'mattn/webapi-vim'
Plug 'google/vim-searchindex'
Plug 'marcweber/vim-addon-mw-utils'
if version >= 704
Plug 'andymass/vim-matchup'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif
Plug 'xolox/vim-misc'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Plug 'pearofducks/ansible-vim'
" Plug 'Absolight/vim-bind'
" Plug 'lukerandall/haskellmode-vim'
" Plug 'vim-scripts/jQuery'
" Plug 'vim-scripts/shorewall.vim'
" Plug 'kovisoft/slimv'
" Plug 'tomtom/tlib_vim'
" Plug 'timcharper/textile.vim'
" Plug 'tpope/vim-cucumber'
" Plug 'neowit/vim-force.com'
" Plug 'pangloss/vim-javascript'
" Plug 'leshill/vim-json'
" Plug 'tpope/vim-markdown'
" Plug 'wlangstroth/vim-racket'
" Plug 'vim-ruby/vim-ruby'
" Plug 'astashov/vim-ruby-debugger'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-rails'
" Plug 'tsaleh/vim-tmux'
" Plug 'hashivim/vim-terraform'
call plug#end()

map <C-n> :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_tomorrow'

function! s:base16_customize() abort
  call Base16hi("MatchParen", "", g:base16_gui01, "", g:base16_cterm01, "bold,italic", "")
  call Base16hi("Search", g:base16_gui07, g:base16_gui01, g:base16_cterm07, g:base16_cterm01, "bold,underline", "")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all modes)

" hlsearch trick: Ctrl-Return to unhighlight search
nnoremap <c-cr> :noh<CR>
" Highlight current word in screen
nnoremap <silent> <F10> :set invhls<CR>:exec "let @/='\\<".expand("<cword>")."\\>'"<CR>

if has("syntax")
    syntax enable
    syntax sync fromstart
endif

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set listchars=tab:>-,trail:-,precedes:<,extends:>
set list
set number
set ruler
set cursorline
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/,CVS*

set showmode
set pastetoggle=<F2>
set scrolloff=3
set laststatus=2

let s:vimdir='~/.vim'
if has('win16') || has('win32') || has('win64')
    let s:vimdir='~/vimfiles'
endif

" Persistant undo file, awesome when used with Gundo
if v:version >= 703
    set undofile
    let &undodir=s:vimdir . '/undo'
endif

if has("multi_byte")
    set encoding=utf-8              " how vim shall represent characters internally
    setglobal fileencoding=utf-8    " empty is also OK (defaults to same as 'encoding'). Or you may want to set one of the ucs encodings (which
    " may use less disk space if you use only "alphabetic" scripts such as Latin, Greek, Cyrillic, Hebrew or Arabic, and
    " not "ideographic" scripts like Chinese, Japanese or Korean. With the ucs encodings it is usually better
    "     set bomb                               " to also set 'bomb' on ('byte-order-mark" option, irrelevant for utf-8 but not for ucs)
    "     set termencoding=iso-8859-15           " or whatever is appropriate to your locale (iso-8859-15 is Latin1 + Euro currency sign)
    "     set fileencodings=ucs-bom,iso-8859-15,iso-8859-3,utf-8
    set fileencodings=ucs-bom,utf-8,cp850
    " or whatever is appropriate to the kinds of files you want to edit
    " 'fileencodings' defines the heuristic to set 'fillencoding' (local to buffer) when reading an existing file. The first one that matches will be used.
    " ucs-bom is "ucs with byte-order-mark"; it must not come after ucs-8 if you want it to be used
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" Session save/restore
nmap SQ <ESC>:mksession! .vimsession<CR>:wqa<CR>
function! RestoreSession()
    if argc() == 0 && filereadable('.vimsession') "vim called without arguments
        execute 'source .vimsession'
    end
endfunction
autocmd VimEnter * call RestoreSession()

autocmd InsertLeave * if pumvisible() == 0|pclose|endif

if has('unix')
    language messages C
else
    language messages en
endif

" vim-force.com required variables
let g:apex_backup_folder=s:vimdir . "/apex/backup"
let g:apex_temp_folder=s:vimdir . "/apex/tmp"
let g:apex_deployment_error_log=s:vimdir . "/apex/error.log"
let g:apex_properties_folder=s:vimdir . "/apex/properties"
runtime ftdetect/apexcode.vim

let g:xml_syntax_folding = 1

let g:lisp_rainbow=1

let mapleader=","

let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

hi Normal ctermbg=none

if exists('g:vimpager.enabled')
    set nowrap
    set norelativenumber
endif
