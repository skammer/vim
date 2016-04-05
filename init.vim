" vim:ft=vim foldmethod=marker

" Setup plugin system {{{

call plug#begin('~/.config/nvim/plugged')

" }}}

" Neobundle bundles {{{

Plug 'bling/vim-airline'
" Themes {{{
" Plug 'endel/vim-github-colorscheme'
Plug 'w0ng/vim-hybrid'
" Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
" Plug 'guns/jellyx.vim'
Plug 'vim-scripts/xoria256.vim'
" Plug 'tejr/sahara'
" Plug 'altercation/vim-colors-solarized'
Plug 'noahfrederick/vim-hemisu'
Plug 'morhetz/gruvbox'
Plug 'jeffreyiacono/vim-colors-wombat'
Plug 'paranoida/vim-airlineish'
Plug 'vim-airline/vim-airline-themes'
Plug 'robertmeta/nofrils'
" }}}

" Langs {{{
Plug 'leafgarland/typescript-vim'
Plug 'groenewege/vim-less'
" Plug 'slim-template/vim-slim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'fatih/vim-go'
" Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'
Plug 'wting/rust.vim'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
Plug 'jimenezrick/vimerl'
Plug 'lambdatoast/elm.vim'
Plug 'ajhager/elm-vim'
" Plug 'marijnh/tern_for_vim'
" Plug 'clausreinke/typescript-tools.vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'neovim/node-host', { 'do': 'npm install' }
" Plug 'snoe/nvim-parinfer.js'
" }}}

" Tools {{{
Plug 'kien/ctrlp.vim'
" Plug 'JazzCore/ctrlp-cmatcher/', { 'do': 'CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments ./install.sh' }
  " Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'edsono/vim-matchit'
  " Plug 'ervandew/supertab'
  " Plug 'SirVer/ultisnips'
  " Plug 'honza/vim-snippets'
" Plug 'junegunn/vim-easy-align'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'raymond-w-ko/vim-niji'
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
" Plug 'sjl/gundo.vim'
Plug 'mbbill/undotree'
Plug 'skammer/vim-swaplines'
" Plug 'terryma/vim-expand-region'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'Deraen/vim-cider'
" Plug 'venantius/vim-cljfmt'
Plug 'venantius/vim-eastwood'
Plug 'vim-scripts/vimwiki', { 'for': 'vimwiki' }
" Plug 'scrooloose/syntastic'
" Plug 'jaxbot/syntastic-react'
Plug 'benekastah/neomake'
Plug 'Lokaltog/vim-easymotion'
" Plug 'ryanss/vim-hackernews'
" Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'Keithbsmiley/investigate.vim'

" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
"
" Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-startify'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'jlanzarotta/bufexplorer'
" }}}

call plug#end()

" }}}

if filereadable(expand("~/.config/nvim/settings/settings.vim"))
  source ~/.config/nvim/settings/settings.vim
endif

if filereadable(expand("~/.config/nvim/settings/mappings.vim"))
  source ~/.config/nvim/settings/mappings.vim
endif

if filereadable(expand("~/.config/nvim/settings/abbreviations.vim"))
  source ~/.config/nvim/settings/abbreviations.vim
endif

if filereadable(expand("~/.config/nvim/settings/plugin_settings.vim"))
  source ~/.config/nvim/settings/plugin_settings.vim
endif

if filereadable(expand("~/.config/nvim/settings/filetype_settings.vim"))
  source ~/.config/nvim/settings/filetype_settings.vim
endif

" Fix make in macvim
if filereadable("Makefile")
  set makeprg=cd\ %:p:h\ &&\ make\ -j
elseif filereadable("Rakefile")
  set makeprg=rake
elseif &filetype == 'go'
  set makeprg=go\ run\ %
else
  set makeprg=make\ %:r
endif

" tslime bindings
"vmap <C-c><C-c> <Plug>SendSelectionToTmux
"nmap <C-c><C-c> <Plug>NormalModeSendToTmux
"nmap <C-c>r <Plug>SetTmuxVarsa
"

" Start vimclojure nailgun server (uses screen.vim to manage lifetime)
"nmap <silent> <Leader>sc :execute "ScreenShell ~/.vim-lib/vimclojure/ng-server" <cr>
" Start a generic Clojure repl (uses screen.vim)
"nmap <silent> <Leader>sC :execute "ScreenShell lein repl" <cr>

" enables the reading of .vimrc, .exrc and .gvimrc in the current directory.
set exrc

" must be written at the last.  see :help 'secure'.
set secure

let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider = 1
let g:python_host_skip_check = 1

