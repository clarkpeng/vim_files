set nocompatible              " required
filetype off                  " required
set mouse=a

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'jremmen/vim-ripgrep'
Plug 'vim-scripts/indentpython.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/multiplesearch'
Plug 'https://gitlab.com/lstwn/broot.vim'
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

set encoding=utf-8

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let python_highlight_all=1
syntax on

set bg=dark
set hlsearch
set incsearch
set ignorecase

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
" NERDTreeToggle
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>f :Files<CR>

" git blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.java match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.py,*.java
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"set clipboard=unnamed
set clipboard=

set guifont=Menlo\ Regular:h18

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
\ --bind ctrl-y:preview-up,ctrl-e:preview-down,
\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
\ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
\shift-up:preview-top,shift-down:preview-bottom,
\alt-up:half-page-up,alt-down:half-page-down"


