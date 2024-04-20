return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  "folke/neodev.nvim",
  -- Themes
  -- 'sainnhe/edge',
  -- 'fenetikm/falcon',
  -- 'bluz71/vim-moonfly-colors',
  -- 'rebelot/kanagawa.nvim',
  -- 'catppuccin/nvim',
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()

      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_better_performance = 1

      vim.cmd([[colorscheme gruvbox-material]])
    end
  },
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd([[colorscheme gruvbox]])
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'     -- optional
    }
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  'windwp/nvim-autopairs',

  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',

  'skammer/vim-swaplines',

  'Lokaltog/vim-easymotion',
  'junegunn/vim-peekaboo',

  {
    'dense-analysis/ale',
    config = function()
      -- Configuration goes here.
      local g = vim.g

      g.ale_ruby_rubocop_auto_correct_all = 1

      g.ale_linters = {
        ruby = {'rubocop', 'ruby'},
        lua = {'lua_language_server'}
      }
    end
  },

  -- tpope
  'tomtom/tlib_vim',
  'tpope/vim-abolish',
  'tpope/vim-endwise',
  'tpope/vim-eunuch',
  'tpope/vim-fugitive',
  'tpope/vim-git',
  'tpope/vim-ragtag',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'tpope/vim-dispatch',
  'radenling/vim-dispatch-neovim',
  'tpope/vim-projectionist',

  -- LLMs
  -- {
  --   'huggingface/llm.nvim',
  --   opts = {
  --     backend = "openai",
  --     model = "",
  --     url = "http://localhost:1234/v1/completions",
  --     -- cf https://github.com/abetlen/llama-cpp-python?tab=readme-ov-file#openai-compatible-web-server
  --     request_body = {}
  --   }
  -- },
  --
  --
  -- {
  -- "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --
  --     require("chatgpt").setup({
  --       api_host_cmd = "echo http://localhost:1234",
  --       api_key_cmd = "echo '1'",
  --       openai_params = {
  --         model = "codellama:13b",
  --         frequency_penalty = 0,
  --         presence_penalty = 0,
  --         max_tokens = 300,
  --         temperature = 0,
  --         top_p = 1,
  --         n = 1,
  --       },
  --       openai_edit_params = {
  --         model = "codellama:13b",
  --         frequency_penalty = 0,
  --         presence_penalty = 0,
  --         temperature = 0,
  --         top_p = 1,
  --         n = 1,
  --       },
  --     })
  --
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "folke/trouble.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- },


  -- {
  --   "dpayne/CodeGPT.nvim",
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --   },
  --   config = function()
  --     require("codegpt.config")
  --   end
  -- },


  -- Languages
  'sirtaj/vim-openscad',

  -- rust
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  -- clojure
  "Olical/conjure",
  'guns/vim-clojure-highlight',
  'guns/vim-clojure-static',
  'guns/vim-sexp',
  'tpope/vim-sexp-mappings-for-regular-people',
  'tpope/vim-repeat',
  'tpope/vim-surround',

  'tpope/vim-fireplace',
  'tpope/vim-salve',
  'tpope/vim-classpath',

  'clojure-vim/vim-cider',

  'clojure-vim/async-clj-omni',
  'gberenfield/cljfold.vim',
  'clojure-vim/vim-jack-in',

  'clojure-vim/async-clj-highlight',
  'radenling/vim-dispatch-neovim',
  'Vigemus/impromptu.nvim',
  'clojure-vim/jazz.nvim',

  -- forth
  -- 'vim-scripts/forth.vim',

  -- vimwiki
  'vimwiki/vimwiki',
}
