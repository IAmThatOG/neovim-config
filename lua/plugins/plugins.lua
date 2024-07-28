return {
    -- 'gbprod/nord.nvim',
    "shaunsingh/nord.nvim",
    "christoomey/vim-tmux-navigator",
    -- 'tpope/vim-surround',
    "numToStr/Comment.nvim", -- for easy single or multi-line comment
    -- 'nvim-lua/plenary.nvim',
    -- 'nvim-tree/nvim-web-devicons', -- editor icons
    "windwp/nvim-autopairs", -- autoclose brackets
    "lewis6991/gitsigns.nvim", -- git manipulations
    "wakatime/vim-wakatime", -- time tracker
    "sbdchd/neoformat", -- applies code formatters
    "ThePrimeagen/harpoon", -- Primeagen baby
    "onsails/lspkind.nvim", -- vscode-like autocompletions
    { -- syntax highlighting
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    { -- autoclose tags
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter" },
    },
    { -- fuzzy finder
        "nvim-telescope/telescope.nvim",
        version = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- use 'nvim-tree/nvim-tree.lua' -- file explorer
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- telescope sorter
    { -- clipboard
        "AckslD/nvim-neoclip.lua",
        dependencies = { "nvim-telescope/telescope.nvim" },
    },
    { -- editor-like tabs
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "L3MON4D3/LuaSnip",
        tag = "v2.3.0",
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp",
    },
    { -- lsp config
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {

            -- LSP Support
            "neovim/nvim-lspconfig", -- Required
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim", -- Optional

            -- Autocompletion
            "nvim-lualine/lualine.nvim", -- neovim status line
            "hrsh7th/nvim-cmp", -- autocompletion
            "hrsh7th/cmp-buffer", -- autocompletion
            "hrsh7th/cmp-path", -- autocompletion
            "hrsh7th/cmp-nvim-lsp-signature-help", -- function signatures
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" }, -- Required
        },
    },
    { -- enhanced lsp UIs
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
        },
    },
}
