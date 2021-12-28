""""""""""""""""""""""""""""""
" => Plugin related
""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'voldikss/vim-floaterm' 
" Plugin 'tc50cal/vim-terminal' 
" Plugin 'morhetz/gruvbox' 
Plugin 'joshdick/onedark.vim' 
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'ton/vim-alternate'
" Plugin 'NLKNguyen/papercolor-theme' 
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""

let mapleader = ","

"  When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END
syntax on

""""""""""""""""""""""""""""""
" => NERDTree related
""""""""""""""""""""""""""""""
map <F1> :NERDTree<CR>
map <F2> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => Alternate related
""""""""""""""""""""""""""""""
nmap <silent> <leader>` :Alternate<CR>
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => CtrlP related
""""""""""""""""""""""""""""""
map <leader>f :CtrlP<CR>
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => Syntastic related
""""""""""""""""""""""""""""""
" Recommended settings
" The set commands below are commented because airline does the necessary changes
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => Floaterm related
""""""""""""""""""""""""""""""
" map <leader>t :FloatermNew --height=0.8 --width=0.6 --wintype=float --name=floaterm1 --position=bottomright<CR>
" Remember to add commmands to FloatermNew terminal add --cmd="<command>"
" map <A-g> :FloatermNew --height=0.8 --width=0.6 --wintype=float --name=floaterm1 --position=bottomright

let g:floaterm_keymap_toggle = '<leader>m'
let g:floaterm_keymap_kill = '<leader>M'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.8
let g:floaterm_position = 'bottomright'
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => General settings (mostly set commands)
""""""""""""""""""""""""""""""
set smarttab
set fileformats=unix,dos,mac " support all three, in this order

" no vi compat
set nocompatible

set cindent                             " indent on cinwords
set expandtab
set smarttab
set shiftwidth=4                " set shiftwidth to 4 spaces
set tabstop=4                   " set tab to 4 spaces

set showmatch                   " Show matching brackets/braces/parantheses.
set background=dark
set scrolloff=8
set number
set ruler
set hid

" Linebreak on 500 characters
set lbr
set tw=500

set swapfile
set dir=~/tmp

" Set timeout length to 500 ms
set timeoutlen=750 

set cinwords=if,else,while,do,for,switch,case,class,try,catch,private,public   " Which keywords should indent

" Height of the command bar
set cmdheight=1 

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => colorscheme
""""""""""""""""""""""""""""""

set background=dark
try
    colorscheme onedark 
catch
endtry

""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => quick commands 
""""""""""""""""""""""""""""""
" command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" quick save
nmap <leader>w :w!<cr>
" quick exit
nmap <leader>q :q<cr>
nmap <leader>! :q!<cr>
" quick hide highlighted
map <leader>h :noh<CR> 
" highlight Search ctermfg=black
" highlight Search ctermbg=green
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => When searching, the highlighted words blink for each n/N
""""""""""""""""""""""""""""""
nnoremap <silent> n n:call HLNext(0.1) <cr>
nnoremap <silent> N N:call HLNext(0.1) <cr>
function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""
