set directory=.,$TEMP
set nocompatible
filetype off

" Required Vundle setup
if has("win32") || has("win16")
    set runtimepath+=~/vimfiles/bundle/Vundle.vim
    call vundle#begin('~/vimfiles/bundle/')
else
    set runtimepath+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

Bundle 'gmarik/Vundle.vim'
if v:version >= '702'
Bundle 'vim-scripts/AutoComplPop'
endif
Bundle 'vim-scripts/DirDiff.vim'
if exists('g:github_user') && executable('git')
Bundle 'vim-scripts/Gist.vim'
endif
if v:version >= '703' && has('python')
Bundle 'vim-scripts/Gundo'
Bundle 'klen/python-mode'
endif
Bundle 'vim-scripts/IndexedSearch'
Bundle 'chriskempson/base16-vim'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'ciaranm/inkpot'
Bundle 'vim-scripts/jQuery'
Bundle 'vim-scripts/matchit.zip'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'junegunn/seoul256.vim'
Bundle 'vim-scripts/shorewall.vim'
Bundle 'kovisoft/slimv'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle "honza/vim-snippets"
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'tomtom/tcomment_vim'
Bundle 'timcharper/textile.vim'
Bundle 'vim-scripts/vcscommand.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'neowit/vim-force.com'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'leshill/vim-json'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-pathogen'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'wlangstroth/vim-racket'
Bundle 'tpope/vim-rails'
Bundle 'thinca/vim-ref'
Bundle 'tpope/vim-repeat'
Bundle 'vim-ruby/vim-ruby'
Bundle 'astashov/vim-ruby-debugger'
Bundle 'tsaleh/vim-shoulda'
Bundle 'tpope/vim-surround'
Bundle 'tsaleh/vim-tmux'
Bundle 'tpope/vim-vividchalk'

call vundle#end()

set t_Co=256
colorscheme seoul256
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

if has("autocmd")
" Uncomment the following to have Vim jump to the last position when
" reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
  filetype plugin indent on
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
" %% expands to current path
cabbr %% <C-R>=expand('%:p:h')<CR>

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
set showtabline=2
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

set tabline=%!MyTabLine()
"
" Configure tabs for the console version
"
function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999Xclose'
    endif

    return s
endfunction

function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return bufname(buflist[winnr - 1])
endfunction

" C-PgUp & C-PgDn are already used to cycle through tabs
nmap <C-Insert> :tabnew<CR>
imap <C-Insert> <ESC>:tabnew<cr>
nmap <C-Delete> :tabclose<CR>
imap <C-Delete> <ESC>:tabclose<cr>
" map \tx for the console version as well
if !has("gui_running")
    nmap <Leader>tn :tabnext<cr>
    nmap <Leader>tp :tabprevious<cr>
    nmap <Leader><F4> :tabclose<cr>
end

" NERDTree binding
noremap <C-P><C-P> :NERDTreeToggle<CR>

" For Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
if has("python")
    python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
" map <C-h> :py EvaluateCurrentRange()
endif

"
" Status line configuration gotten from: http://rgarciasuarez.free.fr/dotfiles/vimrc
"
set ls=2 " Always show status line
if has('statusline')
    " Status line detail:
    " %f                file path
    " %y                file type between braces (if defined)
    " %([%R%M]%)        read-only, modified and modifiable flags between braces
    " %{'!'[&ff=='default_file_format']}
    "                   shows a '!' if the file format is not the platform default
    " %{'$'[!&list]}    shows a '*' if in list mode
    " %{'~'[&pm=='']}   shows a '~' if in patchmode
    " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
    "                   only for debug : display the current syntax item name
    " %=                right-align following items
    " #%n               buffer number
    " %l/%L,%c%V        line number, total number of lines, and column number
    function SetStatusLineStyle()
        if &stl == '' || &stl =~ 'synID'
            let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
        else
            let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V "
        endif
    endfunc
    " Switch between the normal and vim-debug modes in the status line
    nmap _ds :call SetStatusLineStyle()<CR>
    call SetStatusLineStyle()
    " Window title
    if has('title')
        set titlestring=%t%(\ [%R%M]%)
    endif
endif

if has("multi_byte")
     set encoding=utf-8                     " how vim shall represent characters internally
     setglobal fileencoding=utf-8           " empty is also OK (defaults to same as 'encoding'). Or you may want to set one of the ucs encodings (which
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

"let g:Powerline_symbols = 'fancy'

let g:xml_syntax_folding = 1

let g:lisp_rainbow=1

let mapleader=","

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
