let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'zef/vim-cycle'

call plug#end()

let mapleader = ","

set clipboard+=unnamed
set scrolloff=5
set incsearch

" Map <Space> to / (search) and Shift-<Space> to ? (backwards search)
nmap <space> /
nmap <leader><space> ?

" Toggle relative number
nnoremap <C-n> :set rnu!<CR> 

" Place cursor at end of selection after visual yanking 
vmap y ygv<Esc>