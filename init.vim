call plug#begin('~/.config/nvim/plugged')
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  Plug 'roxma/nvim-completion-manager'
  Plug 'w0rp/ale'
  Plug 'nsf/gocode', { 'for': 'go', 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
  Plug 'Shougo/neoinclude.vim', { 'for': ['c', 'cpp'] }
  Plug 'tweekmonster/gofmt.vim', { 'for': ['Go'] }

  Plug 'rakr/vim-one'
  Plug 'NLKNguyen/papercolor-theme'

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  Plug 'igankevich/mesonic'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'sheerun/vim-polyglot'
  Plug 'igankevich/mesonic'

  Plug 'Shougo/denite.nvim'
  Plug 'tomtom/tcomment_vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
  Plug 'rhysd/vim-clang-format'
  Plug 'ap/vim-buftabline'

call plug#end()

" ================ Common =================================

syntax on
filetype plugin indent on
let mapleader=' '       " leader is space 

set hidden 
set number
set relativenumber

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set colorcolumn=80
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set modeline
set modelines=1
set lazyredraw
set nowrap              "Don't wrap lines
set linebreak           "Wrap lines at convenient points
set wildignorecase
set showtabline=2

set scrolloff=8 
set sidescrolloff=15
set sidescroll=1

set hlsearch

" Colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme one

" Backup 
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

" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

" cursor movement windows 
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" terminal 
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

nnoremap <leader>nh :nohlsearch<CR>
nnoremap <leader>h :hide<cr>

" dimensions
nnoremap <leader>- <c-w>_ " Max height
nnoremap <leader>\ <c-w><bar> " Max width leader+|
nnoremap <leader>= <c-w>= " Fair defaults

" Move visual block 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" map to <Leader>cf in C++ code
let g:clang_format#command="clang-format"
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" vim-buftbaline
nmap <esc><tab> :bnext<CR>
nmap <esc><bs> :bprev<CR>

" Clipboard
"vmap <leader>y "+y
"vmap <leader>d "+d
"nmap <leader>p "+p
"nmap <leader>P "+P
"vmap <leader>p "+p
"vmap <leader>P "+P
" Replace the selected text with what's in the yank register
"vmap <leader>r "_dP  

" ===== ncm ================== {{{
set shortmess+=c
" tab select
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" hide menu and insert new line
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" }}}

" ===== Language server neovim ====================== {{{

let g:LanguageClient_serverCommands = {
			\ 'c': ['clangd'],
			\ 'cpp': ['clangd'],
			\ 'go': ['go-langserver'],
			\ 'lua': ['lua-lsp'],
			\ 'rust': ['rustup', 'run', 'stable', 'rls'],
			\ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> <leader>v :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>g :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>f :call LanguageClient_textDocument_formatting()<CR>
"
" ===== ale =========================
"let g:LanguageClient_diagnosticsEnable = 0
" ale
let g:ale_linters = { 'cpp': ['clang'], 'go': ['go build'], 'lua': ['luackeck'] }
let g:ale_cpp_clang_options = '--std=c++1z -Wall'
" (optional, for completion performance) run linters only when I save files
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-v> <Plug>(ale_previous_wrap)
nmap <silent> <C-b> <Plug>(ale_next_wrap)

"""" TODO when to use ALE and when LSP lint
" if filereadable("compile_commands.json")
" let g:ale_completion_enabled = 1

" ===== Snippets =========
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" ===== Multi cursor ==================
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<c-i>'
let g:multi_cursor_prev_key='<c-p>'
let g:multi_cursor_skip_key='<c-x>'
let g:multi_cursor_quit_key='<Esc>'
