" neovim configuration file
" Samir

set nocompatible               " Be iMproved

" for installing packages
call plug#begin()

Plug 'arakashic/chromatica.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()


""  basic config starts here
filetype plugin indent on
syntax enable
set number

"set cmdheight=2
"set foldcolumn=2

"" colorscheme vimrc_background is created by base16_shell 
let base16colorspace=256
source ~/.vimrc_background

"" alert when surpassing 80 chars
call matchadd('ColorColumn', '\%81v', 100) "set column nr
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


set ruler
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P

" max items in popup menu
set pumheight=8

" indicate when a line is wrapped by prefixing wrapped line with '> '
set showbreak=>\ 

" highlight search matches
set hlsearch

" show matching enclosing chars for .1 sec
set showmatch
set matchtime=1


"" chromatica settings
let g:chromatica#enable_at_startup = 1
let g:chromatica#libclang_path='/usr/lib/libclang.so'
"let g:chromatica#highlight_feature_level=1
let g:chromatica#responsive_mode=1

"" Use deoplete.
let g:deoplete#enable_at_startup = 1

"" clang complete stuff
let g:clang_library_path='/usr/lib/libclang.so'
