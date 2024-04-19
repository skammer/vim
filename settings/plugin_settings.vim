" vim:foldmethod=marker foldlevel=0

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
" if has("gui_macvim") && has("gui_running")
"   call AddMapping('nerdcommenter', 'map', '<D-/>', '<plug>NERDCommenterToggle<CR>')
"   call AddMapping('nerdcommenter', 'imap', '<D-/>', '<Esc><plug>NERDCommenterToggle<CR>i')
" else
"   call AddMapping('nerdcommenter', 'map', '<leader>/', '<plug>NERDCommenterToggle<CR>')
"   call AddMapping('nerdcommenter', 'imap', '<leader>/', '<Esc><plug>NERDCommenterToggle<CR>i')
" endif
" }}}

" TComment mappings {{{
if has("gui_macvim") && has("gui_running")
  call AddMapping('tcomment', 'map', '<D-/>', ':TComment<CR>')
  call AddMapping('tcomment', 'imap', '<D-/>', '<Esc>:TComment<CR>')
else
  call AddMapping('tcomment', 'map', '<leader>/', 'gcc')
  call AddMapping('tcomment', 'imap', '<leader>/', '<Esc>gcc')
endif
" }}}

" NERDTree {{{
let NERDTreeHijackNetrw = 0
let g:NERDTreeMouseMode = 3
"let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

" alternative mappings
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
"let g:nerdtree_tabs_open_on_gui_startup = 0

" Default mapping, <leader>n
call AddMapping('nerdtree', 'map', '<leader>n', ':NvimTreeToggle<CR>')

"augroup AuNERDTreeCmd
"autocmd AuNERDTreeCmd VimEnter * call CdIfDirectory(expand("<amatch>"))
"autocmd AuNERDTreeCmd FocusGained * call UpdateNERDTree()

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
"let g:syntastic_quiet_warnings=0
" let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes = ['sass', 'scss', 'css']
let g:syntastic_javascript_checkers = ['eslint']
" }}}

" Neomake {{{
let g:neomake_jsx_enabled_makers = ['eslint']
" function! neomake#makers#ft#javascript#eslint()
"     return neomake#makers#ft#jsx#eslint()
" endfunction
" }}}

" Tagbar {{{
call AddMapping('tagbar', 'map', '<Leader>rt', ':TagbarToggle<CR>')
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
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
" nmap <leader>R :RainbowParenthesesToggle<CR>
" }}}

" HTML tag closing {{{
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a
" }}}

" Yankring {{{
nnoremap <silent> <F6> :YRShow<cr>
" }}}

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

" YCM {{{
let g:ycm_server_python_interpreter = '/usr/local/bin/python'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" let g:ycm_semantic_triggers = {'clojure' : ['/']}
let g:ycm_cache_omnifunc = 0

let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0

" augroup set_completeopt
"   au!
"   au Filetype * set completeopt=menu,preview
" augroup END

" }}}

" Ultisnips {{{

" Trigger configuration. Do not use <tab> if you use 
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

" SuperTab {{{
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

" Deoplete {{{

let g:deoplete#enable_at_startup = 1
" let g:deoplete#disable_auto_complete = 1
let g:deoplete#enable_smart_case = 1
" let g:deoplete_source_attribute_min_pattern_length=3
" let g:deoplete#enable_auto_close_preview = 1

" let g:deoplete#omni#functions.javascript = [
"       \   'jspc#omni',
"       \   'tern#Complete',
"       \ ]
if !exists('g:deoplete#omni#input_patterns')
  " let g:deoplete#omni#input_patterns = {}
endif

if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni_patterns = {}
endif

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" let g:deoplete#omni_patterns.javascript = '[^. *\t]\.\w*\|: [A-Z]\w*'
" let g:deoplete#omni_patterns.clojure = '[[:alnum:]_-]\+'

" let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<Tab> for regular tab
" inoremap <Leader><Tab> <Space><Space>

" }}}

" Completion manager {{{
let g:cm_complete_delay = 100
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<CR>" : "\<CR>")
inoremap <expr> <UP> (pumvisible() ? "\<c-y>\<UP>" : "\<UP>")
inoremap <expr> <DOWN> (pumvisible() ? "\<c-y>\<DOWN>" : "\<DOWN>")
inoremap <expr> <LEFT> (pumvisible() ? "\<c-y>\<LEFT>" : "\<LEFT>")
inoremap <expr> <RIGHT> (pumvisible() ? "\<c-y>\<RIGHT>" : "\<RIGHT>")

" }}}

" Tern  {{{

if exists('g:plugs["tern_for_vim"]')
  " let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1


  let g:tern_request_timeout = 1
  " let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete

  " let g:tern#command = ["tern"]
  " let g:tern#arguments = ["--persistent"]

  " autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" }}}

" CtrlP {{{
"let g:ctrlp_map = ''

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.sass-cache$\|tmp$\|node_modules\|.idea$\|target\|out\|.cljs_rhino_repl\|nashorn_code_cache\|resources/public/js/build$\|.shadow-cljs$\|cljs-runtime\|.clj-kondo',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\|\.png$\|\.jpg\|\.DS_Store$\',
  \ }

" let g:ctrlp_lazy_update = 50

let g:ctrlp_match_window = 'bottom,order:ttb'

" let g:ctrlp_switch_buffer = 'e'
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0


" let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

"let g:ctrlp_user_command = 'find %s -type f'
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --column -g ""'

if executable("rg")
  let g:CtrlSpaceGlobCommand = 'rg -g ""'
endif

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
" if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --column -g ""'
" endif


" }}}

" Racer {{{
let g:racer_experimental_completer = 1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unite {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:unite_source_history_yank_enable = 1
let g:unite_data_directory='~/.vim/unite'
let g:unite_source_rec_max_cache_files=100
let g:unite_source_grep_max_candidates = 100

let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 15

"let g:unite_candidate_icon = '-'
"let g:unite_marked_icon = '+'

"let g:unite_source_grep_default_opts = '-i -l -g --nocolor'

if executable('ag')
  let g:unite_source_rec_async_command = 'ag -l -g ""'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--smart-case --nogroup --nocolor --line-numbers'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_rec_async_command = 'ack -f --nofilter'
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-color --no-heading'
  let g:unite_source_grep_recursive_opt = ''
endif


"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#custom_source('file_rec', 'matchers', ['matcher_fuzzy'])

let s:unite_ignores = [
  \ '\.git', 'deploy', 'dist',
  \ 'undo', 'tmp', 'backups',
  \ 'generated', 'build', 'images']

"call unite#custom#source('file_mru,file_rec,file_rec/async,buffer,grepocate',
  "\ 'ignore_pattern', 
  "\ join(s:unite_ignores, '\|'))

"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])


" sort file results by length
"call unite#custom#source('file', 'sorters', 'sorter_length')
"call unite#custom#source('file_rec/async', 'sorters', 'sorter_rank')

" limit results for recently edited files
"call unite#custom#source('file_mru', 'max_candidates', 10)

" ignored files for file_mru
"call unite#custom#source('file_mru', 'ignore_pattern', 'COMMIT_EDITMSG')

" sort buffers by number
"call unite#custom#source('buffer', 'sorters', 'sorter_reverse')


"call unite#custom#source('file,file/new,buffer,file_rec', 'matchers', 'matcher_fuzzy')

"autocmd FileType unite call s:unite_settings()

"function! s:unite_settings()
  "let b:SuperTabDisabled=1
  "imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  "imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  "imap <silent><buffer><expr> <C-x> unite#do_action('split')
  "imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  "imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  "nmap <buffer> <ESC> <Plug>(unite_exit)
"endfunction

" }}}


" Clojure {{{
let g:clojure_align_subforms = 1
let g:clojure_maxlines = 0
" }}}


" Airline {{{
" let g:airline_theme='tomorrow'
" let g:airline_theme='airlineish'
" let g:airline_theme='gruvbox'
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

" }}}

" Lightline {{{
" let g:lightline = {
"       \ 'colorscheme': 'srcery',
"       \ }
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
" }}}

" Sexp {{{
" let g:sexp_enable_insert_mode_mappings = 0
" }}}

" vim-racer {{{
let g:racer_cmd = "/Users/skammer/.cargo/bin/racer"
let g:racer_experimental_completer = 1
" }}}

" Powerline {{{
" Use compatible symbols in statusline
"let g:Powerline_symbols = "compatible"
"let g::Powerline_symbols = 'fancy'
" Use a different Powerline cache file for gvim
let g:Powerline_cache_file = "/tmp/Powerline-gvim.cache"
" }}}


" Ack {{{
" cnoreabbrev ag Ack
" cnoreabbrev aG Ack
" cnoreabbrev Ag Ack
" cnoreabbrev AG Ack

let g:ackprg = 'ag --vimgrep --smart-case'

if executable("rg")
  let g:ackprg = 'rg --vimgrep --no-heading'
endif
" }}}

" DWM.vim settings
let g:dwm_map_keys=1


" Indent gudies {{{

let g:indent_guides_color_change_percent = 5

" }}}

" Clojure Folding {{{

let g:clojure_foldwords = "def,defn,defmacro,defmethod,defschema,defprotocol,defrecord"

" }}}

" Language Client {{{
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls']
      \ }
" }}}
