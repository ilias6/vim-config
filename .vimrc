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
" Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'voldikss/vim-floaterm' 
Plugin 'tpope/vim-abolish' 
Plugin 'kana/vim-arpeggio' 
" Plugin 'tc50cal/vim-terminal' 
" Plugin 'morhetz/gruvbox' 
" Plugin 'NLKNguyen/papercolor-theme' 
Plugin 'joshdick/onedark.vim' 
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
 
Plugin 'tpope/vim-surround' 
Plugin 'tpope/vim-repeat'
Plugin 'Valloric/YouCompleteMe' 
Plugin 'Raimondi/delimitMate'
" " debugger
Plugin 'puremourning/vimspector'

Plugin 'dense-analysis/ale'
" Plugin 'vim-syntastic/syntastic'
" " Nodejs Plugins:
autocmd FileType javascript set formatprg=prettier\ --stdin
" Plugin 'neoclide/coc.nvim'
" " C++ Plugins:
Plugin 'ton/vim-alternate'
Plugin 'LucHermitte/vim-refactor' 
" " these are required for vim-refactor
Plugin 'LucHermitte/lh-vim-lib' 
Plugin 'LucHermitte/lh-dev' 
" Plugin 'LucHermitte/lh-brackets' 
Plugin 'LucHermitte/lh-style' 
Plugin 'LucHermitte/lh-tags' 
" " For jupyter notebook:
Plugin 'goerz/jupytext.vim'
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
" => vimspector related
""""""""""""""""""""""""""""""
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
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
" => Indent-Guides related
""""""""""""""""""""""""""""""
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=61
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=97
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => CtrlP related
""""""""""""""""""""""""""""""
map <leader>f :CtrlP<CR>
let g:ctrlp_show_hidden=1
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => Fzf related
""""""""""""""""""""""""""""""
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
" let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
" let g:fzf_preview_window = []

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => airline related
""""""""""""""""""""""""""""""
" the separator used on the left side
" let g:airline_left_sep=''
" the separator used on the right side 
" let g:airline_right_sep=''
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => Syntastic related
""""""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => Floaterm related
""""""""""""""""""""""""""""""
" map <leader>t :FloatermNew --height=0.8 --width=0.6 --wintype=float --position=bottomright --name=

" Remember to add commmands to FloatermNew terminal add --cmd="<command>"
" map <A-g> :FloatermNew --height=0.8 --width=0.6 --wintype=float --name=floaterm1 --position=bottomright

let g:floaterm_keymap_toggle = '<leader>m'
let g:floaterm_keymap_next = '<leader>tn'
let g:floaterm_keymap_prev= '<leader>tp'
let g:floaterm_keymap_kill = '<leader>M'
let g:floaterm_keymap_new = '<leader>tt'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.8
let g:floaterm_position = 'bottomright'
""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => General settings (mostly set commands)
""""""""""""""""""""""""""""""
" zo(open) - zc(close) - zm(incr) - zr(decr)
set foldmethod=indent
set foldlevel=1
set foldclose=all

set smarttab
set fileformats=unix,dos,mac " support all three, in this order

" no vi compat
set nocompatible

set cindent                             " indent on cinwords
set expandtab
set smarttab
set shiftwidth=2               " set shiftwidth to 4 spaces
set tabstop=2                  " set tab to 4 spaces

set showmatch                   " Show matching brackets/braces/parantheses.
set scrolloff=8
set number
set ruler
set hid

" Linebreak on 500 characters
set lbr
set tw=500

set swapfile
set backup
set undofile
set backupdir=".backup/, ~/.backup/, /tmp//"
set directory=".swp/, ~/.swp/, /tmp//"
set undodir=".undo/, ~/.undo/, /tmp//"

" Set timeout length to 500 ms
set timeoutlen=600 
set ttimeoutlen=0 

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
nmap <leader>wq :wq!<cr>
nmap <leader>! :q!<cr>
" quick hide highlighted
nmap <leader>h :noh<CR> 
" quick swap between windows
" Arpeggio nmap <leader>ee :<C-w><C-w> 
call arpeggio#map('n', '', 0, 'we', '<C-w>w')
call arpeggio#map('i', '', 0, 'we', '<Esc><C-w>w')
" jk -> Esc
call arpeggio#map('i', '', 0, 'jk', '<Esc>')
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
