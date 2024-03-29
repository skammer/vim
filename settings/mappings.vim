" vim:foldmethod=marker

""
"" General Mappings (Normal, Visual, Operator-pending)
""

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nmap <leader>fef ggVG=

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

nnoremap << <<

""
"" Command-Line Mappings
""

" Insert the current directory into a command-line path
cmap <C-P> <C-R>=expand("%:p:h") . "/"<CR>


" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" "Focus" the current line. {{{{
"  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.

" Pulse Line

function! s:Pulse() " {{{
    let current_window = winnr()
    windo set nocursorline
    execute current_window . 'wincmd w'
    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 9
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi
endfunction " }}}
" }}}
" nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>
" command! -nargs=0 Pulse call s:Pulse()

" Use the normal HIG movements, except for M-Up/Down {{{
if has('gui_running')
  "let macvim_skip_cmd_opt_movement = 1
  no   <D-Left>       <Home>
  no!  <D-Left>       <Home>
  no   <M-Left>       <C-Left>
  no!  <M-Left>       <C-Left>

  no   <D-Right>      <End>
  no!  <D-Right>      <End>
  no   <M-Right>      <C-Right>
  no!  <M-Right>      <C-Right>

  no   <D-Up>         <C-Home>
  ino  <D-Up>         <C-Home>
  imap <M-Up>         <C-o>{

  no   <D-Down>       <C-End>
  ino  <D-Down>       <C-End>
  imap <M-Down>       <C-o>}

  vmap <bs> d

  imap <M-BS>         <C-w>
  " inoremap <D-BS>     <esc>my0c`y
  inoremap <D-BS>    <C-u>

  nmap <SwipeLeft> gT
  nmap <SwipeRight> gt

  nmap <SwipeLeft> :bN<CR>
  nmap <SwipeRight> :bn<CR>
endif
" }}}

" Edit ~/.vimrc
map <leader>ed :e ~/.config/nvim/init.vim<CR>
" Reload ~/.vimrc
map <leader>rv :source ~/.config/nvim/init.vim<CR>
" Vertical split
map <leader>vsp :vnew<cr>
" Horizontal split
map <leader>sp :new<CR>


" split-it mapping
"nmap <leader>-  :new<CR>
"nmap <leader>[  :vnew<CR>
"nmap <leader>]  :rightbelow vnew<CR>
"nmap <leader>_  :rightbelow new<CR>

" Fold/unfold block
imap <silent> <D-d> <Esc>za
vmap <silent> <D-d> za
nmap <silent> <D-d> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Jump to next line
imap <D-Enter> <Esc>o
" Jump to previous line
imap <D-S-Enter> <Esc>O

" Switching buffers
map <S-D-Left> :bp<cr>
imap <S-D-Left> <ESC>:bp<cr>

map <S-D-Right> :bn<cr>
imap <S-D-Right> <ESC>:bn<cr>


" Strip trailing whitespaces {{{
fun! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

command! StripTrailingWhitespaces :call StripTrailingWhitespaces()
" }}}

" Retab and strip whitespaces {{{
fun! Beautify()
  retab
  call StripTrailingWhitespaces()
endf

command! Beautify :call Beautify()
" }}}

" Map cyrillic letters so they work in normal mode {{{
map ё ´
map й j
map ц c
map у u
map к k
map е e
map н n
map г g
map ш w
map щ `
map з z
map х x
map ъ =
map ф f
map ы y
map в v
map а a
map п p
map р r
map о o
map л l
map д d
map ж ]
map э \
map я q
map ч h
map с s
map м m
map и i
map т t
map ь -
map б b
map ю [

map Ё ´
map Й J
map Ц C
map У U
map К K
map Е E
map Н N
map Г G
map Ш W
map Щ `
map З Z
map Х X
map Ъ =
map Ф F
map Ы Y
map В V
map А A
map П P
map Р R
map О O
map Л L
map Д D
map Ж ]
map Э \
map Я Q
map Ч H
map С S
map М M
map И I
map Т T
map Ь -
map Б B
map Ю [

" }}}

" This one is pretty neat. Sorts css selectors alphabetically.
map <leader>ss ?{<CR>jV/^\s*\}\=$<CR>k:sort<CR>:let @/=''<CR>

nnoremap Y y$
nnoremap D d$


" Keep search matches in the middle of the window.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" L is easier to type, and I never use the default behavior.
" noremap L $

" Open a Quickfix window for the last search
nnoremap <silent> <leader>s :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Fix linewise visual selection of various text objects
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" Formatting, TextMate-style
nnoremap <leader>q gqip

" Easier linewise reselection
nnoremap <leader>v V`]

" Replaste
nnoremap <D-p> "_ddPV`]

" Toggle line number display mode {{{
" function! NumberToggle()
"   if(&relativenumber == 1)
"     set number
"   else
"     set relativenumber
"   endif
" endfunc
" nnoremap <leader>l :call NumberToggle()<cr>
" }}}

function! NyanMe() " {{{
    hi NyanFur             guifg=#BBBBBB
    hi NyanPoptartEdge     guifg=#ffd0ac
    hi NyanPoptartFrosting guifg=#fd3699 guibg=#fe98ff
    hi NyanRainbow1        guifg=#6831f8
    hi NyanRainbow2        guifg=#0099fc
    hi NyanRainbow3        guifg=#3cfa04
    hi NyanRainbow4        guifg=#fdfe00
    hi NyanRainbow5        guifg=#fc9d00
    hi NyanRainbow6        guifg=#fe0000


    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanFur
    echon "╰"
    echohl NyanPoptartEdge
    echon "⟨"
    echohl NyanPoptartFrosting
    echon "⣮⣯⡿"
    echohl NyanPoptartEdge
    echon "⟩"
    echohl NyanFur
    echon "⩾^ω^⩽"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echon " "
    echohl NyanFur
    echon "”   ‟"
    echohl None

    sleep 1
    redraw
    echo " "
    echo " "
    echo "Noms?"
    redraw
endfunction " }}}
command! NyanMe call NyanMe()


" Reload xiki {{{
function! ReloadXiki()
  let xiki_path = system("xiki directory")
  let xipa = "etc/vim/xiki.vim"
  let xiki_full = substitute(xiki_path, '\n$', '\1', '') . xipa
  execute "source " . xiki_full
  echo "Xiki loaded"
endfunc
" }}}
nnoremap <leader>rx :call ReloadXiki()<cr>

"noremap <C-h> <C-w>h
"noremap <C-j> <C-w>j
"noremap <C-l> <C-w>l
"noremap <C-k> <C-w>k


" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" disable janus maps that conflict with VimClojure
"unmap <leader>et
"unmap <leader>rt


" Fancy Paste {{{
nnoremap ,p @=<SID>Paste('p', v:register)<cr>
nnoremap ,P @=<SID>Paste('P', v:register)<cr>

function! s:Paste(paste_key, register)
  let whitespace_pattern = '^\(\s*\).*$'
  let pasted_text        = getreg(a:register)
  let register_type      = getregtype(a:register)
  let local_whitespace   = substitute(getline('.'), whitespace_pattern, '\1', '')
  let pasted_whitespace  = substitute(pasted_text, whitespace_pattern, '\1', '')

  let formatted_lines = []
  for line in split(pasted_text, "\n")
    let line = substitute(line, '^'.pasted_whitespace, local_whitespace, '')
    call add(formatted_lines, line)
  endfor

  call setreg(a:register, join(formatted_lines, "\n"), register_type)
  exe 'normal! "'.a:register.a:paste_key
endfunction

" }}}

" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

nmap ,r :Require! <bar> Eval (clojure.test/run-tests)<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nnoremap <Leader>o :CtrlP<CR>
nmap <Leader><Leader> V

vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

map q: :q

noremap gV `[v`]

autocmd FileType ruby noremap <Leader>r :T rake<CR>
autocmd FileType rust noremap <Leader>r :RustRun<CR>



" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
