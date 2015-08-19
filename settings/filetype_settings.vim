"
" Filetype settings
"
"
au BufNewFile,BufReadPost Gemfile.lock setf gemfilelock

" Do not use syntax highlighting when opening schema.ru
au BufReadPost schema.rb set ft=text

augroup coffeescript
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent
augroup END

""
"" Helpers
""

" Some file types should wrap their text
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

""
"" File types
""

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

  au FileType haml set foldmethod=indent

  " This actually might be confusing, but the plugin +ruby+ already does
  " this, so we want to do it only if the plugin +ruby+ is disabled for
  " some reason
  "if janus#is_plugin_disabled("ruby")
    " Set the Ruby filetype for a number of common Ruby files without .rb
    "au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,config.ru,*.rake} set ft=ruby
  "endif

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  au BufNewFile,BufRead *.wiki set ft=vimwiki

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4

  au FileType erlang setlocal softtabstop=4 tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  "au BufRead,BufNewFile *.go set noet ts=4 sw=4
  "au FileType go au BufWritePost Fmt
  "au BufWritePost *.go silent! !ctags -R &

  autocmd Filetype gitcommit setlocal spell textwidth=72

endif



