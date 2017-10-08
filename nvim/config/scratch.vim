" ncm
" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
"/let g:clang_compilation_database='build'
" 
"
"
" let g:ale_cpp_clangcheck_options = 'p ./build'
" let g:ale_linters = { 'cpp' : ['clangcheck'] }
"
"
"let g:deoplete#sources#clang#autofill_neomake = 1

let g:neomake_cpp_enabled_makers = ["clang"]

let g:gutentags_ctags_executable = "uctags"

" let g:neomake_cpp_enabled_makers = ['clangtidy']
" let g:neomake_cpp_clangtidy_maker = {
   " \ 'exe': 'clang-tidy',
   " \ 'args': ['-checks=*', '-p=./build' ],
   " \}
 "syntax 
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
