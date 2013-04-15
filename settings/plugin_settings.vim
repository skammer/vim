" CtrlP {{{
"let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.sass-cache$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

let g:ctrlp_switch_buffer = 'e'

call AddMapping('ctrlp', 'map', '<D-p>', ':CtrlP<CR>')
call AddMapping('ctrlp', 'imap', '<D-p>', '<ESC>:CtrlP<CR>')

"if has("gui_macvim") && has("gui_running")
  "call AddMapping('ctrlp', 'map', '<D-t>', ':CtrlP<CR>')
  "call AddMapping('ctrlp', 'imap', '<D-t>', '<ESC>:CtrlP<CR>')
"else
  "call AddMapping('ctrlp', 'map', '<C-t>', ':CtrlP<CR>')
  "call AddMapping('ctrlp', 'imap', '<C-t>', '<ESC>:CtrlP<CR>')
"endif

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
map <Leader>n <plug>NERDTreeTabsToggle<CR>
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

" Map <Leader><Leader> to ZoomWin
call AddMapping('zoomwin', 'map', '<leader>zw', ':ZoomWin<CR>')

