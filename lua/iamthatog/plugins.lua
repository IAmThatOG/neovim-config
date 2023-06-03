-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- for auto update when plugins are added
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- current editor theme
  -- use 'shaunsingh/moonlight.nvim'
  -- use 'folke/tokyonight.nvim'
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use 'christoomey/vim-tmux-navigator'

  -- surround word or sentence with character
  use 'tpope/vim-surround' -- yss<character>, ysw<character>

  -- for easy single or multi-line comment
  use 'numToStr/Comment.nvim' -- gcc, gcb

  -- neovim lua functions
  use 'nvim-lua/plenary.nvim'

  -- file explorer
  use 'nvim-tree/nvim-tree.lua'

  -- file icons
  use 'nvim-tree/nvim-web-devicons'

  -- neovim status line
  use 'nvim-lualine/lualine.nvim'

  -- telescope sorter
  -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- lsp config using lsp-zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = ':MasonUpdate',
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhanced lsp uis

  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- treesitter configuration for syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }

  -- wakatime plugin time tracker
  use 'wakatime/vim-wakatime'

  -- for editor-like tabs
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons',
  }

end)

