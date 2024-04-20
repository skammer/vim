vim.cmd([[

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

if filereadable(expand("~/.config/nvim/settings/mappings.vim"))
  source ~/.config/nvim/settings/mappings.vim
endif

if filereadable(expand("~/.config/nvim/settings/abbreviations.vim"))
  source ~/.config/nvim/settings/abbreviations.vim
endif

if filereadable(expand("~/.config/nvim/settings/filetype_settings.vim"))
  source ~/.config/nvim/settings/filetype_settings.vim
endif

if filereadable(expand("~/.config/nvim/settings/plugin_settings.vim"))
  source ~/.config/nvim/settings/plugin_settings.vim
endif

]])


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("plugins"))

require("configs")
require("mappings")


require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('Comment').setup()
require('nvim-autopairs').setup {}
require("nvim-tree").setup()

vim.g["codegpt_chat_completions_url"] = "http://127.0.0.1:1234/v1/"


local config = {
    api_host_cmd = 'echo -n ""',
    api_key_cmd = 'echo OK',
    api_type_cmd = 'echo azure',
    azure_api_base_cmd = 'echo http://localhost:1234',
    azure_api_engine_cmd = 'echo chat',
    azure_api_version_cmd = 'echo 2023-05-15'
  }

-- require("chatgpt").setup(config)



