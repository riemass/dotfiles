call plug#begin('~/.config/nvim/plugged')
" util
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'schickling/vim-bufonly'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'ap/vim-buftabline'
Plug 'sjl/gundo.vim'
" colorscheme
Plug 'junegunn/seoul256.vim'
" snipets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
" formatting
Plug 'junegunn/vim-easy-align'"
Plug 'nathanaelkane/vim-indent-guides'"
Plug 'rhysd/vim-clang-format'
" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'tweekmonster/deoplete-clang2'
" syntax files
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'honza/dockerfile.vim'
Plug 'sheerun/vim-polyglot'
Plug 'igankevich/mesonic' " sytax + functionality 

Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
" visual
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'oblitum/rainbow'
" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'

" linters
"Plug 'scrooloose/syntastic'
"Plug 'w0rp/ale'
Plug 'neomake/neomake'

Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }

" include test
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/clang_complete'
Plug 'Shougo/neoinclude.vim'
Plug 'richq/vim-cmake-completion'

" tags
Plug 'jsfaint/gen_tags.vim'
Plug 'joereynolds/gtags'
Plug 'lyuts/vim-rtags'
" Plug 'majutsushi/tagbar'
" Plug 'ludovicchabant/vim-gutentags'

call plug#end()
