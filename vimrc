" vim:ft=vim foldmethod=marker

" Pathogen {{{

"call pathogen#infect()

"let g:bundle_groups = ["tools", "langs", "colors"]

"" Load pathogen groups
"function! g:load_pathogen()
  "if !exists("g:loaded_pathogen")
     ""Source Pathogen
    "exe 'source ' . '~/.vim/autoload/pathogen.vim'
  "endif

  "for group in g:bundle_groups
    "call pathogen#infect( '~/.vim/bundle/' . group)
  "endfor

  "call pathogen#helptags()
"endfunction

"let g:pathogen_disabled = ["syntastic"]

"call g:load_pathogen()

" }}}

" Vundle {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" }}}

" Vundle bundles {{{

" Themes {{{
Bundle 'Getafe'
Bundle 'TechnoGate/janus-colors'
Bundle 'altercation/vim-colors-solarized'
Bundle 'larssmit/vim-getafe'
Bundle 'sjl/badwolf'
Bundle 'telamon/vim-color-github'
Bundle 'tpope/vim-vividchalk'
Bundle 'twerth/ir_black'
Bundle 'vim-scripts/Colour-Sampler-Pack'
Bundle 'vim-scripts/molokai'
Bundle 'vim-scripts/pyte'
" }}}

" Langs {{{
Bundle 'ajf/puppet-vim'
Bundle 'cakebaker/scss-syntax.vim'
"Bundle 'chrisbra/csv.vim'
Bundle 'elixir-lang/vim-elixir'
Bundle 'fsouza/go.vim'
"Bundle 'groenewege/vim-less'
"Bundle 'guns/vim-clojure-static'
Bundle 'jimenezrick/vimerl'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mmalecki/vim-node.js'
Bundle 'nono/vim-handlebars'
Bundle 'pangloss/vim-javascript'
"Bundle 'rosstimson/scala-vim-support'
Bundle 'skwp/vim-rspec'
"Bundle 'slim-template/vim-slim'
Bundle 'sunaku/vim-ruby-minitest'
Bundle 'timcharper/textile.vim'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
"Bundle 'vim-scripts/Arduino-syntax-file'
"Bundle 'wlangstroth/vim-haskell'
Bundle 'jnwhiteh/vim-golang'
" }}}

" Tools {{{
Bundle 'gorkunov/smartpairs.vim'
Bundle 'Stormherz/tablify'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Shougo/neocomplcache.vim'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'honza/vim-snippets'
Bundle 'Townk/vim-autoclose'
Bundle 'ap/vim-css-color'
Bundle 'chrisbra/NrrwRgn'
Bundle 'edsono/vim-matchit'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'itspriddle/ZoomWin'
Bundle 'jeetsukumaran/vim-buffergator'
"Bundle 'kien/rainbow_parentheses.vim'
Bundle 'amdt/vim-niji'
Bundle 'majutsushi/tagbar'
"Bundle 'mattn/gist-vim'
"Bundle 'mattn/webapi-vim'
Bundle 'michaeljsmith/vim-indent-object'
"Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
"Bundle 'rgarver/Kwbd.vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'skalnik/vim-vroom'
Bundle 'skammer/vim-swaplines'
Bundle 'spolu/dwm.vim'
"Bundle 'terryma/vim-multiple-cursors'
Bundle 'terryma/vim-expand-region'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fireplace'
"Bundle 'tristen/vim-sparkup'
"Bundle 'vim-scripts/VimClojure'
Bundle 'vim-scripts/vimwiki'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'bling/vim-airline'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'myusuf3/numbers.vim'
Bundle 'austintaylor/vim-indentobject'
Bundle 'nathanaelkane/vim-indent-guides'
" }}}

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

