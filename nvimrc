" neovim configuration file
" Samir

set nocompatible               " Be iMproved

" for installing packages
call plug#begin()

Plug 'arakashic/chromatica.nvim'
Plug 'Shougo/denite.nvim'

Plug 'tpope/vim-fugitive'
Plug 'shirk/vim-gas'

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

Plug 'itchyny/lightline.vim'

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
"source ~/.vimrc_background
if &t_Co >= 256 || has("gui_running")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set background=dark
  try
    source .vimrc_background
  catch
  colorscheme delek  
  endtry
endif



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

"""" now the hard part
"""" PLUGIN SETTINGS

"" chromatica settings
let g:chromatica#enable_at_startup = 1
let g:chromatica#libclang_path='/usr/lib/libclang.so'
"let g:chromatica#highlight_feature_level=1
let g:chromatica#responsive_mode=1

"" Use deoplete and clang complete
let g:deoplete#enable_at_startup = 1
let g:clang_library_path='/usr/lib/libclang.so'

"" Denite mappings
nmap <C-l> :Denite grep<CR>






inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}






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
