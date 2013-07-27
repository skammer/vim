""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

""
"" Whitespace
""

set nowrap                        " don't wrap lines
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
"


let g:ruby_path = '/Users/skammer/.rbenv/shims/ruby'
set autoindent
set smartindent
set cindent
set lazyredraw
set ttyfast
set virtualedit+=block
"set virtualedit=all
set fillchars=diff:⣿,vert:│
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·
set showbreak=↪
set linebreak
"set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=+1

"set guioptions-=elLrR
"set guioptions+=c

set guioptions=c

set scrolloff=3

"set shell=zsh\ -i

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

set autowrite
set autoread

set background=dark
"let g:badwolf_tabline = 2
"let g:badwolf_html_link_underline = 0
"colorscheme badwolf
"colorscheme Tomorrow-Night-2
"color jellybeans+
color Tomorrow-Night
"color Tomorrow

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


"set guifont=Terminus:h12
"set guifont=Envy\ Code\ R:h11
"set noanti
"set guifont=Anonymous\ Pro:h13
"set guifont=Monaco:h12
set guifont=Liberation\ Mono\ for\ Powerline:h13


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/public/assets/*     " MacOSX/Linux

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" Run :Lorem to insert famous Lorem ipsum quote
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum.

