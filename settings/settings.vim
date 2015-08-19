""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
" set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
set nohidden          " Do not hide buffers

""
"" Whitespace
""

" set nowrap                        " don't wrap lines
set wrap                          " wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

if has("gui_running")
  if has("autocmd")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
  endif
endif

if has("autocmd")
  if exists("g:autosave_on_blur")
    au FocusLost * silent! wall
  endif
endif

"
" My custom settings
"

let g:ruby_path = '/Users/skammer/.rbenv/shims/ruby'
let g:python_host_prog = '/usr/local/bin/python'
set autoindent
set smartindent
set cindent
" set lazyredraw
set nolazyredraw
" set ttyfast
set virtualedit+=block
"set virtualedit=all
set fillchars=diff:⣿,vert:│
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·
set showbreak=↪
set linebreak
"set wrap
"set textwidth=80
"set formatoptions=qrn1
"set formatoptions=rqan1
set formatoptions=crqwan1
set colorcolumn=+1

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction


"set guioptions-=elLrR
"set guioptions+=c

set guioptions=c

"set scrolloff=3

"set shell=zsh\ -i

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=500

set autowrite
set autoread


" if has("gui_macvim") && has("gui_running") " CMDs {{{
"   set background=light
"   colorscheme Tomorrow
" else
"   set background=dark
"   colorscheme hybrid
" endif


set background=dark
" colorscheme hybrid
" colorscheme jellyx
" colorscheme hemisu
" colorscheme jellybeans
" colorscheme Tomorrow-Night
" colorscheme Tomorrow
" colorscheme sahara
" colorscheme base16-default
" colorscheme wombat
colorscheme gruvbox


"color getafe
" Do not display uganda crap
set shortmess=aoOtTI

" Make terminal play nicely
set t_Co=256
set mouse+=a
" set ttymouse=xterm2

set shiftround

set splitbelow
set splitright

set laststatus=2
set statusline=%<\ %{&ff}\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%t\ %Y\ %n\ %m%r%h%w\ %{fugitive#statusline()}\ %=%03p%%\ [%04l,%04v]\ %L

set foldmethod=syntax
set foldenable

"set foldcolumn=3

"set foldlevelstart=-1
set foldlevelstart=99

function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
"set foldtext=MyFoldText()

set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ \|\ '.(v:foldend-v:foldstart)

" use 12 for retina
" set guifont=Anonymous\ Pro:h12
" set guifont=Source\ Code\ Pro:h12
"set guifont=PragmataPro:h13
set guifont=Anka/Coder:h12
" set guifont=Fira\ Code:h13

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/public/assets/*     " MacOSX/Linux

"set cursorline

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" Run :Lorem to insert famous Lorem iapsum quote
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum.

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif


function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()
