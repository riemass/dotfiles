if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif
" Plugins {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'tomtom/tcomment_vim'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-sensible'
Plug 'sjl/gundo.vim'
Plug 'lyuts/vim-rtags'
Plug 'blerins/flattown'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'junegunn/vim-easy-align'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'osyo-manga/vim-over'
Plug 'schickling/vim-bufonly'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-dispatch'
Plug 'honza/dockerfile.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'rhysd/vim-clang-format'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'semirpuskarevic/YCM-Generator', { 'branch': 'meson' }
Plug 'vim-scripts/gtags.vim'
Plug 'jsfaint/gen_tags.vim'
Plug 'igankevich/mesonic'
Plug 'vhdirk/vim-cmake'
Plug 'majutsushi/tagbar'
Plug 'itchyny/lightline.vim'
Plug 'oblitum/rainbow'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'richq/vim-cmake-completion'
Plug 'idanarye/vim-dutyl'
call plug#end()
" }}}
" Basic Settings {{{
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
" Custom Functions {{{

" toggle between number and relativenumber
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
" }}}
" Scrolling {{{
set scrolloff=8 
set sidescrolloff=15
set sidescroll=1
" }}}
" Colorscheme {{{
if &t_Co >= 256 || has("gui_running")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set background=dark
  try
    colorscheme PaperColor " awesome colorscheme
  catch
  colorscheme delek  
  endtry
endif
" }}}
" Search and highlight {{{
" turn off search highlight
set hlsearch
nnoremap <leader>nh :nohlsearch<CR>
" highlight last inserted text
nnoremap gV `[v`]
" }}}
"Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Persistent Undo {{{
set undodir=~/.undodir
set undofile
set undolevels=1000 "maximum number of set changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
" }}}
" }}}
" Plugin Settings {{{
" Vim plugins {{{
" YCM {{{
"let g:ycm_key_list_previous_completion = []
"let g:ycm_key_list_select_completion = []
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>jd :YcmCompleter GoTo<CR>
"}}}
" Syntastic {{{
"let g:syntastic_auto_jump = 1
let g:syntastic_check_on_open = 1
"let g:syntastic_echo_current_error = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_signs = 1
let g:syntastic_cpp_compiler_options = '-std=c++14 '
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_cpp_check_header = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚑"
"let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_error_symbol = 'E'
"let g:syntastic_style_error_symbol = 'E'
"let g:syntastic_style_warning_symbol = 'W'
"let g:syntastic_warning_symbol = 'W'
" }}}
" }}}
" vim-buftbaline {{{
set hidden
nmap <esc><tab> :bnext<CR>
nmap <esc><bs> :bprev<CR>
" }}}
" Ultisnips {{{
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger="<c-j>"
" }}}
" Incsearch {{{
set viminfo='100,f1  "Save up to 100 marks, enable capital marks
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-easymotion-/)
map ?  <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}
" Clang Format {{{
let g:clang_format#style_options = {
      \ "AccessModifierOffset" : -4,
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "Standard" : "C++11"}
" map to <Leader>cf in C++ code
let g:clang_format#command="clang-format"
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" }}}
" fzf-vim {{{
nnoremap <silent> <leader>f :MProjectFileSelector<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>c :Commands<CR>
" }}}
" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction


let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" }}}
" Indentline {{{
let g:indentLine_char = '┆'
let g:indentLine_color_term = 16
" }}}
" Signify {{{
let g:signify_vcs_list = ['git']
let g:signify_sign_add = '⨁'
let g:signify_sign_delete = '⨴'
let g:signify_sign_delete_first_line = '⨂'
let g:signify_sign_change = '⨸'
let g:signify_sign_changedelete = '⨂'
" }}}
" ACK {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}
" RainbowParentheses {{{
au FileType c,cpp,objc,objcpp call rainbow#load()
" }}}
" GTags {{{
"
nnoremap <Leader>gg :Gtags
nnoremap <Leader>gn :cn<CR>
nnoremap <Leader>gp :cp<CR>
nnoremap <Leader>gj :GtagsCursor<CR>
nnoremap <Leader>gi :Gtags -f %<CR>

" }}}
" Mproject {{{
autocmd FileType cpp nnoremap <silent> <leader>tt :MProjectDispatchTests<CR>
autocmd FileType cpp nnoremap <silent> <leader>ts :MProjectSelectTestExe<CR>
autocmd FileType cpp nnoremap <silent> <leader>tc :MProjectSelectTestCase<CR>
" }}}
" Multiple Cursors {{{
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<c-i>'
let g:multi_cursor_prev_key='<c-p>'
let g:multi_cursor_skip_key='<c-x>'
let g:multi_cursor_quit_key='<Esc>'
" }}} 
" }}}
  " Buffer Settings {{{
  " meson {{{
  augroup meson
    autocmd!
    autocmd BufWritePost meson.build MProjectUpdateConfig
  augroup END
  " }}}
  " c {{{
  augroup c
	  autocmd!
	  autocmd FileType c nnoremap <silent> <buffer> <leader>dd :call ClangGotoDeclaration()<CR><Esc>
	  autocmd FileType c nnoremap <silent> <buffer> <leader>dp :call ClangGotoDeclarationPreview()<CR><Esc>
    " autocmd BufWritePost * Neomake!
	  " autocmd BufRead,BufNewFile *.h set filetype=c
  augroup END
  " }}}
  " vim {{{
  augroup vim
	  autocmd!
	  autocmd FileType vim setlocal foldmethod=marker
  augroup END
  " }}}
  " }}}
" Testing {{{

let g:cppproject#build_dir_name = "build"

function! s:find_test_exe()
  return split(system("find $(pwd) -executable -exec file {} \\; | grep ELF | cut -d':' -f1"),'\n')
endfunction

function! s:find_test_exe_c(e)
  let g:cppproject#test_file_exe = a:e
  execute "MProjectSelectTestCase"
	call feedkeys('i')
endfunction

function! s:find_test_case()
  let l:fzf_filter_strings = ["*;*"]
  let l:vec = split(system(g:cppproject#test_file_exe . " " . "--gtest_list_tests"),"\n")
  let l:case_name = ""
  for l:var in l:vec
    if l:var[0] != " "
      let l:case_name = l:var[:-2] . ";"
      call add(l:fzf_filter_strings,l:case_name . "*")
    else
      call add(l:fzf_filter_strings,l:case_name . matchstr(l:var,'\w\+'))
    endif
  endfor
  return l:fzf_filter_strings
endfunction

function! s:find_test_case_c(e)
  let l:case_name = split(a:e,";")
  let g:cppproject#test_to_run = l:case_name
endfunction

function! s:run_tests()
  if !exists('g:cppproject#project_root_path')
    execute "echo 'Configure the project first!'"
    return
  endif
  if !exists('g:cppproject#test_file_exe')
    execute "echo 'Select a test exe file!'"
    return
  endif
  execute "Make"
  execute "echo 'Running tests!'"
  execute 'lcd ' . g:cppproject#project_root_path . "/" . g:cppproject#build_dir_name
  let l:makeprg=&makeprg
  let l:errorformat=&errorformat
  let &makeprg=g:cppproject#test_file_exe
  set errorformat=%f:%l:\ %m
  silent execute "Make" . "'--gtest_filter=" . join(g:cppproject#test_to_run,".") . "'"
  let &makeprg=l:makeprg
  let &errorformat=l:errorformat
endfunction

function! s:project_generate_config()
  if !exists('g:cppproject#project_root_path')
    let g:cppproject#project_root_path = getcwd()
    execute "MesonInit"
    execute "YcmGenerateConfig"
  endif
endfunction

function! s:project_update_config()
  if exists('g:cppproject#project_root_path')
    execute 'lcd ' . g:cppproject#project_root_path
    execute "YcmGenerateConfig"
  endif
endfunction

function! s:project_select_files()
  if exists('g:cppproject#project_root_path')
    execute "lcd " . g:cppproject#project_root_path
  endif
  execute "Files"
endfunction


command!  MProjectSelectTestExe call fzf#run({
      \ 'source': <sid>find_test_exe(), 
      \ 'sink': function('<sid>find_test_exe_c'),
      \ 'options': '+m',
      \ 'down': len(<sid>find_test_exe()) + 2
      \})

command! MProjectSelectTestCase call fzf#run({
      \ 'source': <sid>find_test_case(), 
      \ 'sink': function('<sid>find_test_case_c'),
      \ 'options': '+m',
      \ 'down': len(<sid>find_test_case()) + 2
      \})

command! MProjectDispatchTests call <sid>run_tests()
command! MProjectFileSelector call <sid>project_select_files()
command! MPInit call <sid>project_generate_config()
command! MProjectUpdateConfig call <sid>project_update_config()
" "}}}
  " General Mappings and Functions {{{
" misc {{{
inoremap ,, <esc>
:map <F5> :setlocal spell! spelllang=en_us<CR>
" hide buffer
nnoremap <leader>h :hide<cr>
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>rW mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" cd to change to open directory.
map <leader>cd :cd %:p:h<cr>
" no / /\v

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
nnoremap <leader>tN :call ToggleNumber()<CR>
nnoremap <leader>rR :Dispatch! "rdm"<CR>
"}}}
" edit vimrc/bashrc and load vimrc bindings {{{
nnoremap <leader>eV :e $MYVIMRC<CR>
nnoremap <leader>eB :e ~/.bashrc<CR>
nnoremap <leader>sV :source $MYVIMRC<CR>
set mouse=a
" set completeopt=longest,menuone
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
" Search and highlight {{{
" turn off search highlight
nnoremap <leader>nh :nohlsearch<CR>
" highlight last inserted text
nnoremap gV `[v`]
" }}}
"}}}
