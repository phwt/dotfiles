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
set number
set belloff=esc

" Map <Space> to / (search) and Shift-<Space> to ? (backwards search)
nmap <space> /
nmap <leader><space> ?

" Toggle relative number
nnoremap <C-n> :set rnu!<CR> 

" Place cursor at end of selection after visual yanking 
vmap y ygv<Esc>

" Block cursor on normal mode: https://stackoverflow.com/a/42118416
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
