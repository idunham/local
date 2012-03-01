set ai
set si
"set number
call pathogen#infect()
syntax on
filetype plugin indent on
augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif 
augroup END
