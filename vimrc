" vim:ft=vim foldmethod=marker

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" NeoBundle {{{
 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" }}}

" Neobundle bundles {{{

" Themes {{{
NeoBundle 'endel/vim-github-colorscheme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'guns/jellyx.vim'
NeoBundle 'vim-scripts/xoria256.vim'
NeoBundle 'tejr/sahara'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'noahfrederick/vim-hemisu'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
" }}}

" Langs {{{
NeoBundle "groenewege/vim-less"
NeoBundle 'slim-template/vim-slim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'
NeoBundle 'wting/rust.vim'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'guns/vim-clojure-highlight'
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'
NeoBundle 'guns/vim-sexp'
" }}}

" Tools {{{
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'ap/vim-css-color'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'ervandew/supertab'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'amdt/vim-niji'
NeoBundle 'rking/ag.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'skammer/vim-swaplines'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-leiningen'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'vim-scripts/vimwiki'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'ryanss/vim-hackernews'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
" }}}

call neobundle#end()


" }}}

if filereadable(expand("~/.vim/settings/settings.vim"))
  source ~/.vim/settings/settings.vim
endif

if filereadable(expand("~/.vim/settings/mappings.vim"))
  source ~/.vim/settings/mappings.vim
endif

if filereadable(expand("~/.vim/settings/abbreviations.vim"))
  source ~/.vim/settings/abbreviations.vim
endif

if filereadable(expand("~/.vim/settings/plugin_settings.vim"))
  source ~/.vim/settings/plugin_settings.vim
endif

if filereadable(expand("~/.vim/settings/filetype_settings.vim"))
  source ~/.vim/settings/filetype_settings.vim
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
