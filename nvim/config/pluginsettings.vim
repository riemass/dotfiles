" vim-buftbaline {{{
set hidden
nmap <esc><tab> :bnext<CR>
nmap <esc><bs> :bprev<CR>
" }}}
" Ultisnips {{{
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger="<c-j>"
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
"nnoremap <silent> <leader>f :MProjectFileSelector<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>c :Commands<CR>
" }}}
" Indentline {{{
let g:indentLine_char = '¦'
"let g:indentLine_char = '┆'
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
" ghc-mod {{{
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1
" }}}
