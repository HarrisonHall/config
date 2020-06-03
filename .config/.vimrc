" vimrc
" Install plugins with :PlugInstall

" VimPlugs
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'  " Nord colorscheme
Plug 'junegunn/rainbow_parentheses.vim'  " Rainbow delimeters
Plug 'vim-airline/vim-airline'  " powerline vim

call plug#end()


" general
colorscheme nord  " Use nord colorscheme
set number  " Use line numbers
set mouse=a  " Use mouse

set nowrap  " Don't wrap lines
set cursorline  " Highlight current line

" rainbow
augroup rainbow_lisp
  autocmd!
  autocmd FileType * RainbowParentheses
augroup END

" Powerline
let g:airline_powerline_fonts = 1

" Tabs
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" Remaps
inoremap jj <ESC>
nnoremap <ENTER> r<CR>
