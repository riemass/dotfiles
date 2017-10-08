syntax on
filetype plugin indent on
let mapleader=' '       " leader is space 
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2
set expandtab       " tabs are spaces
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set modeline
set rnu              " show line numbers
set modelines=1
set mouse=a
set lazyredraw
set colorcolumn=80              "Highlight the character limit
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
set wildignorecase
set showtabline=2
set viminfo='100,f1  "Save up to 100 marks, enable capital marks
" old terminal emulator
set guicursor=""
" Custom Functions
" toggle between number and relativenumber
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>tN :call ToggleNumber()<CR>
" Scrolling
set scrolloff=8 
set sidescrolloff=15
set sidescroll=1
" Colorscheme
if &t_Co >= 256 || has("gui_running")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set background=dark
  try
    colorscheme seoul256 " awesome colorscheme
  catch
  colorscheme delek  
  endtry
endif
" Search and highlight
" turn off search highlight
set hlsearch
nnoremap <leader>nh :nohlsearch<CR>
" highlight last inserted text
nnoremap gV `[v`]
"Backup 
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" Persistent Undo 
set undodir=~/.undodir
set undofile
set undolevels=1000 "maximum number of set changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" misc {{{
:map <F5> :setlocal spell! spelllang=en_us<CR>
" hide buffer
nnoremap <leader>h :hide<cr>
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>rW mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" cd to change to open directory.
map <leader>cd :cd %:p:h<cr>
" }}}
" cursor movement windows {{{
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
" }}}
" terminal {{{
if exists(':tnoremap')
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  tnoremap <esc><esc> <C-\><C-n>
  tnoremap <esc><tab> <C-\><C-n>:bnext<CR>
  tnoremap <esc><bs> <C-\><C-n>:bprev<CR>
  tnoremap <c-l> clear<CR>
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
endif
" }}}
" dimensions {{{
nnoremap <leader>- <c-w>_ " Max height
nnoremap <leader>\ <c-w><bar> " Max width leader+|
nnoremap <leader>= <c-w>= " Fair defaults
" }}}
" toggle gundo {{{
nnoremap <leader>tU :GundoToggle<CR>
"}}}
" edit vimrc/zshrc {{{
nnoremap <leader>eV :e $MYVIMRC<CR>
nnoremap <leader>eB :e ~/.zshrc<CR>
set mouse=a
set completeopt=longest,menuone
" }}}
" Move visual block {{{
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" }}}
" Clipboard {{{
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P
vmap <leader>r "_dP       // Replace the selected text with what's in the yank register
" }}}
" Buffer Settings {{{
" c
augroup c
  autocmd!
  autocmd FileType c nnoremap <silent> <buffer> <leader>dd :call ClangGotoDeclaration()<CR><Esc>
  autocmd FileType c nnoremap <silent> <buffer> <leader>dp :call ClangGotoDeclarationPreview()<CR><Esc>
  " autocmd BufWritePost * Neomake!
  " autocmd BufRead,BufNewFile *.h set filetype=c
augroup END
" 
" vim
augroup vim
  autocmd!
	  autocmd FileType vim setlocal foldmethod=marker
  augroup END
" 
" }}}
