" vim:ft=vim foldmethod=marker

" Pathogen {{{

call pathogen#infect()

let g:bundle_groups = ["tools", "langs", "colors"]

" Load pathogen groups
function! g:load_pathogen()
  if !exists("g:loaded_pathogen")
     "Source Pathogen
    exe 'source ' . '~/.vim/autoload/pathogen.vim'
  endif

  for group in g:bundle_groups
    call pathogen#infect( '~/.vim/bundle/' . group)
  endfor

  call pathogen#helptags()
endfunction

let g:pathogen_disabled = ["syntastic"]

call g:load_pathogen()

" }}}

" Vundle {{{
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle
" required! 
"Bundle 'gmarik/vundle'

" }}}

" Vundle bundles {{{

" Themes {{{
" TODO: replace with github repos if possible
"Bundle 'Getafe'
"Bundle 'github-theme'
"Bundle 'molokai'
"Bundle 'pyte'
"Bundle 'Color-Sampler-Pack'
"Bundle 'Solarized'
"Bundle 'vividchalk.vim'
"Bundle 'badwolf'
" }}}

" Tools {{{
"Bundle 'mileszs/ack.vim'
"Bundle 'Buffergator'
"Bundle 'Color-Scheme-Explorer'
"Bundle 'ap/vim-css-color'
"Bundle 'ctrlp.vim'
"Bundle 'EasyMotion'
"Bundle 'endwise.vim'
"Bundle 'fugitive.vim'
"Bundle 'Gundo'

"Bundle 'gmarik/vundle'
"Bundle 'asux/snipmate-snippets'
"Bundle 'tpope/vim-rails'
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-haml'
"Bundle 'tpope/vim-pathogen'
"Bundle 'tpope/vim-surround'
"Bundle 'pangloss/vim-javascript'
"Bundle 'klen/jslint.vim'
"Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'tpope/vim-ragtag'
"Bundle 'tpope/vim-fugitive'
"Bundle 'tpope/vim-markdown'
"Bundle 'tpope/vim-vividchalk'
"Bundle 'tpope/vim-git'
"Bundle 'tpope/vim-endwise'
"Bundle 'akitaonrails/snipmate.vim'
"Bundle 'scrooloose/syntastic'
"Bundle 'wincent/Command-T'
"Bundle 'timcharper/textile.vim'
"Bundle 'vim-ruby/vim-ruby'
"Bundle 'tpope/vim-unimpaired'
"Bundle 'cakebaker/scss-syntax.vim'
"Bundle 'mileszs/ack.vim'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'ervandew/supertab'
"Bundle 'hallison/vim-ruby-sinatra'
"Bundle 'ciaranm/securemodelines'
"Bundle 'kana/vim-textobj-user'
"Bundle 'nelstrom/vim-textobj-rubyblock'
"Bundle 'greyblake/vim-preview'
"Bundle 'tpope/vim-abolish'
"Bundle 'Shadowfiend/liftweb-vim'
"Bundle 'akhil/scala-vim-bundle'
"Bundle 'felipero/grails-vim'
"Bundle 'vim-scripts/VimClojure'
"Bundle 'mattn/zencoding-vim'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'digitaltoad/vim-jade'
"Bundle 'itspriddle/vim-jquery'
"Bundle 'othree/html5.vim'
"Bundle 'sjl/gundo.vim'
"Bundle 'chrismetcalf/vim-yankring'
"Bundle 'tpope/vim-bundler'
"Bundle 'tpope/vim-rvm'
"Bundle 'endel/actionscript.vim'
"Bundle 'asux/vim-capybara'
"Bundle 'jimenezrick/vimerl'
"Bundle 'kana/vim-fakeclip'
"Bundle 'klen/python-mode'
"Bundle 'lambdalisue/vim-django-support'
"Bundle 'drmingdrmer/xptemplate'
"Bundle 'jceb/vim-orgmode'
"Bundle 'majutsushi/tagbar'
"Bundle 'Townk/vim-autoclose'
"Bundle 'mattn/gist-vim'
"Bundle 'henrik/vim-indexed-search'
"Bundle 'tpope/vim-repeat'
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

