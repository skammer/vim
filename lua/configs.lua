local U = require("utils")

local exec = vim.api.nvim_exec -- execute Vimscript
local api = vim.api -- neovim commands
local autocmd = vim.api.nvim_create_autocmd -- execute autocommands
local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands

function filetype_autocmd(filetype, cmd, params)
    autocmd("FileType", { pattern = filetype, command = cmd .. ' ' .. params })
end

function buffer_autocmd(pattern, cmd, params)
    autocmd("BufRead", { pattern = pattern, command = cmd .. ' ' .. params })
end

function hold_autocmd(pattern, cmd)
    autocmd("CursorHold", { pattern = pattern, command = cmd })
end


set.number = true
set.ruler = true
set.encoding = "utf-8"
set.hidden = true
set.signcolumn = "yes"

set.wrap = true
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.list = true
set.listchars = {
    nbsp = '⦸',
    extends = '»',
    precedes = '«',
    tab = '▷─',
    trail = '•',
    space = ' '
}

set.backspace = "2"

set.iskeyword:append("-") -- consider string-string as whole word


-- set incsearch   " incremental searching
-- set ignorecase  " searches are case insensitive...
-- set smartcase   " ... unless they contain at least one capital letter
-- " set inccommand=nosplit
-- let &inccommand = ""
--
-- " Disable output and VCS files
-- set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
--
-- " Disable archive files
-- set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
--
-- " Ignore bundler and sass cache
-- set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
--
-- " Disable temp and backup files
-- set wildignore+=*.swp,*~,._*
-- set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/public/assets/*     " MacOSX/Linux


set.hlsearch = true
set.smartcase = true

set.mouse = "a"


set.undofile = true

set.backupdir = "_backup/"
set.undodir = "_undo/"
set.directory = "_temp/"


-- set.autoindent = true
-- set.smartindent = true
-- set.cindent = true

-- set completeopt=noinsert,menuone,noselect,longest
-- set.wildmenu = true

-- set.nolazyredraw = true
set.ttyfast = true

-- set.noshowcmd = true
set.virtualedit = "block"
set.fillchars = {
  diff = "⣿",
  vert = "|"
}
set.showbreak = "↪"
set.linebreak = true
-- set.formatoptions = "crqwan1"

set.synmaxcol = 500

set.autowrite = true
set.autoread = true

-- cursor line
set.cursorline = true -- highlight the current cursor line

-- spelling
set.spelllang = { "en_us", "ru" } -- Словари рус eng
set.spell = true

-- split windows
set.splitright = true -- split vertical window to the right
set.splitbelow = true -- split horizontal window to the bottom

-- clipboard
set.clipboard:append("unnamedplus") -- use system clipboard as default register

set.shortmess = "aoOtTI"

set.shiftround = true

set.laststatus = 2

-- set statusline=%<\ %{&ff}\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%t\ %Y\ %n\ %m%r%h%w\ %{fugitive#statusline()}\ %=%03p%%\ [%04l,%04v]\ %L


-- set.foldmethod = "syntax"
-- set.foldenable = true
-- set.foldlevelstart = 99
-- set.foldnestmax = 1


-- set.foldtext = "strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ \|\ '.(v:foldend-v:foldstart)"

set.guifont = "Fira Code:h13"

-- Theme

set.termguicolors = true
set.background = "dark"


if U.is_linux() then
    vim.g.python3_host_prog = "/bin/python"
elseif U.is_mac() then
    vim.g.python3_host_prog = "/usr/local/bin/python3"
end
