" vim:ft=vim foldmethod=marker

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/pyton'
let g:loaded_python_provider = 1
let g:python_host_skip_check = 1

" Setup plugin system {{{

call plug#begin('~/.local/share/nvim/plugged')

" }}}

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Neobundle bundles {{{

" Plug 'bling/vim-airline'
Plug 'itchyny/lightline.vim'
" Themes {{{
" Plug 'endel/vim-github-colorscheme'
" Plug 'nanotech/jellybeans.vim'
" Plug 'guns/jellyx.vim'
" Plug 'tejr/sahara'
" Plug 'altercation/vim-colors-solarized'

" Plug 'w0ng/vim-hybrid'
" Plug 'chriskempson/base16-vim'
" Plug 'vim-scripts/xoria256.vim'
" Plug 'noahfrederick/vim-hemisu'
Plug 'morhetz/gruvbox'
" Plug 'jeffreyiacono/vim-colors-wombat'
" Plug 'paranoida/vim-airlineish'
" Plug 'vim-airline/vim-airline-themes'
Plug 'robertmeta/nofrils'
Plug 'sjl/badwolf'

Plug 'jacoborus/tender.vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'jacoborus/tender'
Plug 'ajh17/spacegray.vim'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'

Plug 'owickstrom/vim-colors-paramount'
Plug 'robertmeta/nofrils'
Plug 'CallumHoward/vim-neodark'

Plug 'srcery-colors/srcery-vim'

" }}}

" Langs {{{

" Plug 'roxma/nvim-completion-manager'
" Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
"
Plug 'sirtaj/vim-openscad'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'groenewege/vim-less', { 'for': 'less' }
" Plug 'slim-template/vim-slim'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'sass' }
Plug 'alexlafroscia/postcss-syntax.vim'
Plug 'fatih/vim-go', { 'for': 'go' }
" Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'othree/yajs.vim'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM', { 'for': 'haskell' }

Plug 'roxma/clang_complete'

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'roxma/nvim-cm-racer'
" Plug 'sebastianmarkow/deoplete-rust'

" Clojure
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }

Plug 'jimenezrick/vimerl', { 'for': 'erlang' }
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
Plug 'ajhager/elm-vim', { 'for': 'elm' }
" Plug 'clausreinke/typescript-tools.vim'
Plug 'neovim/node-host', { 'do': 'npm install' }
" Plug 'snoe/nvim-parinfer.js'
Plug 'mv/mv-vim-nginx'
" }}}

" Tools {{{
Plug 'kien/ctrlp.vim'
" Plug 'JazzCore/ctrlp-cmatcher/', { 'do': 'CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments ./install.sh' }
  " Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
" Plug 'ap/vim-css-color'
" Plug 'edsono/vim-matchit'
  " Plug 'ervandew/supertab'
  " Plug 'SirVer/ultisnips'
  " Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
" Plug 'jeetsukumaran/vim-buffergator'
" Plug 'raymond-w-ko/vim-niji'
Plug 'mileszs/ack.vim'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
" Plug 'sjl/gundo.vim'
Plug 'mbbill/undotree'
Plug 'skammer/vim-swaplines'
" Plug 'terryma/vim-expand-region'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
" Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-vinegar'
Plug 'clojure-vim/vim-cider', { 'for': 'clojure' }
Plug 'gberenfield/cljfold.vim', { 'for': 'clojure' }
" Plug 'markwoodhall/vim-figwheel', { 'for': 'clojure' }
" Plug 'venantius/vim-cljfmt'
Plug 'venantius/vim-eastwood'
Plug 'vim-scripts/vimwiki', { 'for': 'vimwiki' }
" Plug 'scrooloose/syntastic'
" Plug 'jaxbot/syntastic-react'
" Plug 'benekastah/neomake'
Plug 'Lokaltog/vim-easymotion'
" Plug 'ryanss/vim-hackernews'
" Plug 'terryma/vim-multiple-cursors'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'Shougo/unite.vim'

" Deoplete makes everything so fucking slow
Plug 'clojure-vim/acid.nvim', { 'for': 'clojure' }

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
" Plug 'carlitux/deoplete-ternjs'
Plug 'clojure-vim/async-clj-omni'

Plug 'Keithbsmiley/investigate.vim'
Plug 'kassio/neoterm'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }

" Live linter
" Plug 'w0rp/ale'

" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --tern-completer --racer-completer' }

" Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-startify'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'jlanzarotta/bufexplorer'
" Plug 'janko-m/vim-test'
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

if filereadable(expand("~/.config/nvim/settings/filetype_settings.vim"))
  source ~/.config/nvim/settings/filetype_settings.vim
endif

if filereadable(expand("~/.config/nvim/settings/plugin_settings.vim"))
  source ~/.config/nvim/settings/plugin_settings.vim
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

let g:clojure_fold = 1

" tslime bindings
"vmap <C-c><C-c> <Plug>SendSelectionToTmux
"nmap <C-c><C-c> <Plug>NormalModeSendToTmux
"nmap <C-c>r <Plug>SetTmuxVarsa
"
" enables the reading of .vimrc, .exrc and .gvimrc in the current directory.
" set exrc

" must be written at the last.  see :help 'secure'.
" set secure

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
