set t_Co=256
set directory=.,$TEMP
set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

if v:version >= '702'
    Plug 'vim-scripts/AutoComplPop'
endif
Plug 'vim-scripts/DirDiff.vim'
if exists('g:github_user') && executable('git')
    Plug 'vim-scripts/Gist.vim'
endif
if v:version >= '703' && has('python')
    Plug 'vim-scripts/Gundo'
    Plug 'klen/python-mode'
endif
Plug 'vim-scripts/IndexedSearch'
Plug 'lukerandall/haskellmode-vim'
Plug 'vim-scripts/jQuery'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/shorewall.vim'
Plug 'kovisoft/slimv'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'timcharper/textile.vim'
Plug 'vim-scripts/vcscommand.vim'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'neowit/vim-force.com'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-pathogen'
Plug 'wlangstroth/vim-racket'
Plug 'tpope/vim-rails'
Plug 'thinca/vim-ref'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'astashov/vim-ruby-debugger'
Plug 'tsaleh/vim-shoulda'
Plug 'tpope/vim-surround'
Plug 'tsaleh/vim-tmux'
Plug 'rakr/vim-two-firewatch'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'hashivim/vim-terraform'

"Plug 'vim-scripts/256-grayvim'
"Plug 'vim-scripts/256-jungle'
"Plug 'vim-scripts/beauty256'
"Plug 'vim-scripts/blacklight'
"Plug 'vim-scripts/calmar256-lightdark.vim'
"Plug 'vim-scripts/desert256.vim'
"Plug 'vim-scripts/donbass.vim'
"Plug 'vim-scripts/The-Vim-Gardener'
"Plug 'vim-scripts/icansee.vim'
"Plug 'vim-scripts/inkpot'
"Plug 'nanotech/jellybeans.vim'
"Plug 'w0ng/vim-hybrid'
"Plug 'tpope/vim-vividchalk'
"Plug 'jnurmine/Zenburn'
"Plug 'vim-scripts/khaki.vim'
"Plug 'vim-scripts/lettuce.vim'
"Plug 'vim-scripts/Liquid-Carbon'
"Plug 'vim-scripts/leo256'
"Plug 'lodestone/lodestone.vim'
"Plug 'vim-scripts/Lucius'
"Plug 'vim-scripts/lilypink'
"Plug 'vim-scripts/pink'
Plug 'vim-scripts/peaksea'
"Plug 'mrkn/mrkn256.vim'
"Plug 'tomasr/molokai'
"Plug 'vim-scripts/miko'
"Plug 'vim-scripts/southernlights'
"Plug 'vim-scripts/rdark-terminal'
"Plug 'altercation/vim-colors-solarized'
"Plug 'vim-scripts/strange'
"Plug 'vim-scripts/summerfruit256.vim'
"Plug 'vim-scripts/synic.vim'
"Plug 'vim-scripts/tabula.vim'
"Plug 'vim-scripts/tchaba'
"Plug 'vim-scripts/tir_black'
"Plug 'vim-scripts/vilight.vim'
"Plug 'vim-scripts/wombat256.vim'
"Plug 'vim-scripts/xoria256.vim'
"Plug 'sjl/badwolf'
"Plug 'baskerville/bubblegum'
"Plug 'vim-scripts/Simple256'
"Plug 'noah/fu'
"Plug 'vim-scripts/crt.vim'
"Plug 'vim-scripts/colorful256.vim'
"Plug 'vim-scripts/charged-256.vim'
"Plug 'vim-scripts/Gentooish'
"Plug 'vim-scripts/greenvision'
"Plug 'nelstrom/vim-mac-classic-theme'
"Plug 'jonathanfilip/vim-lucius'
"Plug 'zeis/vim-kolor'
"Plug '29decibel/codeschool-vim-theme'
"Plug 'Lokaltog/vim-distinguished'
"Plug 'morhetz/gruvbox'
"Plug 'junegunn/seoul256.vim'
"Plug 'romainl/Apprentice'
"Plug 'whatyouhide/vim-gotham'
"Plug 'romainl/Disciple'
"Plug 'gosukiwi/vim-atom-dark'
"Plug 'blerins/flattown'
"Plug 'GertjanReynaert/cobalt2-vim-theme'
"Plug 'ajh17/Spacegray.vim'
"Plug 'stulzer/heroku-colorscheme'
"Plug 'atelierbram/vim-colors_atelier-schemes'
"Plug 'mtglsk/mushroom'
"Plug 'fxn/vim-monochrome'
"Plug 'justincampbell/vim-railscasts'
"Plug 'jedverity/feral-vim'
"Plug 'widatama/vim-phoenix'
"Plug 'queyenth/oxeded.vim'
"Plug 'antlypls/vim-colors-codeschool'
"Plug 'cocopon/iceberg.vim'
"Plug 'ChasingLogic/ChasingLogic-colorscheme-vim'
"Plug 'sk1418/last256'
"Plug 'baverman/vim-babymate256'
"Plug 'noahfrederick/vim-hemisu'
"Plug 'larssmit/vim-getafe'
"Plug 'goatslacker/mango.vim'
"Plug 'lxmzhv/vim'
"Plug 'uu59/vim-herokudoc-theme'
"Plug 'gregsexton/Muon'
"Plug 'MaxSt/FlatColor'
"Plug 'vim-scripts/BusyBee'
"Plug 'vim-scripts/C64.vim'
"Plug 'gmarik/ingretu'
"Plug 'farseer90718/flattr.vim'
"Plug 'duythinht/vim-coffee'
"Plug 'reedes/vim-colors-pencil'
"Plug 'alem0lars/vim-colorscheme-darcula'
"Plug 'chriskempson/base16-vim'
"Plug 'trapd00r/neverland-vim-theme'
"Plug 'chriskempson/vim-tomorrow-theme'
"Plug 'trusktr/seti.vim'
call plug#end()

set background=dark " or light if you prefer the light version
"let g:two_firewatch_italics=1
"colo two-firewatch
colorscheme peaksea

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

let g:xml_syntax_folding = 1

let g:lisp_rainbow=1

let mapleader=","

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
