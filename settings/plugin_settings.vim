" vim:foldmethod=marker

function! AddMapping(name, mapping_command, mapping_keys, ...)
  if len(a:000) < 1
    throw "The arguments to janus#add_mapping() should be <name> <mapping_command> <mapping_keys> <mapping_action> [mapping_action]*"
  endif

  let mapping_command = join(a:000)

  let mapping_list = [a:mapping_command, a:mapping_keys, mapping_command]
  exe join(mapping_list)
endfunction

" VimWiki {{{
let g:vimwiki_use_mouse  = 1
let g:vimwiki_folding    = 1
let g:vimwiki_fold_lists = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_auto_checkbox = 1
let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'C', 'ruby': 'Ruby', 'haml': 'Haml', 'css': 'css', 'asm': 'asm'}
let vimwiki_list = [wiki]
let g:vimwiki_hl_headers = 0
let g:vimwiki_camel_case = 0
let g:vimwiki_conceallevel = 0
" }}}

" Fugitive {{{
call AddMapping('fugitive', 'nmap', '<leader>gb', ':Gblame<CR>')
call AddMapping('fugitive', 'nmap', '<leader>gd', ':Gdiff<CR>')
call AddMapping('fugitive', 'nmap', '<leader>gs', ':Gstatus<CR>')
call AddMapping('fugitive', 'nmap', '<leader>gl', ':Glog<CR>')
call AddMapping('fugitive', 'nmap', '<leader>gc', ':Gcommit<CR>')
call AddMapping('fugitive', 'nmap', '<leader>gp', ':Git push<CR>')
" }}}

" Gist {{{
if executable("pbcopy")
  " The copy command
  let g:gist_clip_command = 'pbcopy'
elseif executable("xclip")
  " The copy command
  let g:gist_clip_command = 'xclip -selection clipboard'
elseif executable("putclip")
  " The copy command
  let g:gist_clip_command = 'putclip'
end

" detect filetype if vim failed auto-detection.
let g:gist_detect_filetype = 1
" }}}

" Toggle Gundo {{{
call AddMapping('gundo', 'nmap', '<F5>', ':GundoToggle<CR>')
call AddMapping('gundo', 'imap', '<F5>', '<ESC>:GundoToggle<CR>')
map <leader>gt :GundoToggle<CR>
" }}}

" kwbd {{{
call AddMapping('kwbd', 'nmap', '<C-W>!', '<Plug>Kwbd')
" }}}

" NERDCommenter mappings {{{
if has("gui_macvim") && has("gui_running")
  call AddMapping('nerdcommenter', 'map', '<D-/>', '<plug>NERDCommenterToggle<CR>')
  call AddMapping('nerdcommenter', 'imap', '<D-/>', '<Esc><plug>NERDCommenterToggle<CR>i')
else
  call AddMapping('nerdcommenter', 'map', '<leader>/', '<plug>NERDCommenterToggle<CR>')
  call AddMapping('nerdcommenter', 'imap', '<leader>/', '<Esc><plug>NERDCommenterToggle<CR>i')
endif
" }}}

" NERDTree {{{
let NERDTreeHijackNetrw = 0
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

" alternative mappings
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup = 0

" Default mapping, <leader>n
call AddMapping('nerdtree', 'map', '<leader>n', ':NERDTreeToggle<CR>')

augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd VimEnter * call CdIfDirectory(expand("<amatch>"))
autocmd AuNERDTreeCmd FocusGained * call UpdateNERDTree()

" If the parameter is a directory, cd into it
function CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction
" }}}

" Syntastic {{{
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes = ['sass', 'scss', 'css']
" }}}

" Tagbar {{{
call AddMapping('tagbar', 'map', '<Leader>rt', ':TagbarToggle<CR>')
" }}}

" Tabularize {{{

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
  nmap <Leader>a:: :Tabularize /:\zs<CR>
  vmap <Leader>a:: :Tabularize /:\zs<CR>
  nmap <Leader>a, :Tabularize /,<CR>
  vmap <Leader>a, :Tabularize /,<CR>
  nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
  vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

  " The following function automatically aligns when typing a
  " supported character
  inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

  function! align()
      let p = '^\s*|\s.*\s|\s*$'
      if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
          let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
          let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
          Tabularize/|/l1
          normal! 0
          call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
      endif
  endfunction

endif
" }}}

" Rainbows! {{{
nmap <leader>R :RainbowParenthesesToggle<CR>
" }}}

" HTML tag closing {{{
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a
" }}}

" Yankring
nnoremap <silent> <F6> :YRShow<cr>

" Unimpared {{{
" Normal Mode: Bubble single lines
call AddMapping('unimpaired', 'nmap', '<C-Up>', '[e')
call AddMapping('unimpaired', 'nmap', '<C-Down>', ']e')

" Visual Mode: Bubble multiple lines
call AddMapping('unimpaired', 'vmap', '<C-Up>', '[egv')
call AddMapping('unimpaired', 'vmap', '<C-Down>', ']egv')

" }}}

" javascript-librarie-syntax.vim {{{
let g:used_javascript_libs = 'underscore,angularjs,jquery'
" }}}

" Map <Leader><Leader> to ZoomWin
call AddMapping('zoomwin', 'map', '<leader>zw', ':ZoomWin<CR>')

" Neocomplete {{{ 
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()


" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"inoremap <silent><CR>  <C-R>=neocomplcache#smart_close_popup()<CR><CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}


" Neosnippets {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" }}}

" CtrlP {{{
"let g:ctrlp_map = ''

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.sass-cache$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

"let g:ctrlp_lazy_update = 1

let g:ctrlp_switch_buffer = 'e'

let g:ctrlp_user_command = 'find %s -type f'

  call AddMapping('ctrlp', 'map', '<D-p>', ':CtrlP<CR>')
  call AddMapping('ctrlp', 'imap', '<D-p>', '<ESC>:CtrlP<CR>')

"if has("gui_macvim") && has("gui_running")
  "call AddMapping('ctrlp', 'map', '<D-t>', ':CtrlP<CR>')
  "call AddMapping('ctrlp', 'imap', '<D-t>', '<ESC>:CtrlP<CR>')
"else
  "call AddMapping('ctrlp', 'map', '<C-t>', ':CtrlP<CR>')
  "call AddMapping('ctrlp', 'imap', '<C-t>', '<ESC>:CtrlP<CR>')
"endif

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g %s'
endif


" }}}

" Unite
"let g:unite_source_history_yank_enable = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#custom_source('file_rec', 'matchers', ['matcher_fuzzy'])
"nnoremap <C-p> :Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
"nnoremap <C-P> :<C-u>Unite file_rec/async<cr>
"nnoremap <leader>t :<C-r>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
"nnoremap <leader>f :<C-r>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>r :<C-r>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
"nnoremap <leader>o :<C-r>Unite -no-split -buffer-name=outline -start-insert outline<cr>
"nnoremap <leader>y :<C-r>Unite -no-split -buffer-name=yank    history/yank<cr>
"nnoremap <leader>e :<C-r>Unite -no-split -buffer-name=buffer  buffer<cr>

let g:unite_source_grep_command="ag"
let g:unite_source_grep_default_opts = '-i -l -g --nocolor'
let g:unite_source_grep_recursive_opt = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ ], '\|'))

"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-u> :<C-u>Unite  -buffer-name=files   -start-insert buffer file_rec/async:!<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction








" Airline settings
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_right_sep = ''
let g:airline_linecolumn_prefix = '␊ '
let g:airline_linecolumn_prefix = '␤ '
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_paste_symbol = 'Þ'
let g:airline_paste_symbol = '∥'

" DWM.vim settings
let g:dwm_map_keys=1

" Powerline


