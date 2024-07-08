-- import nvim-treesitter plugin safely
local treesitter_setup, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_setup then
    print("treesitter plugin not installed")
    return
end

-- configure treesitter
treesitter.setup({
    -- enable syntax highlighting
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    -- enable indentation
    indent = { enable = true },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    -- autotag = { enable = true }, 
    -- ensure these language parsers are installed
    -- ensure_installed = {
    --   "c",
    --   "json",
    --   "javascript",
    --   "jsdoc",
    --   "typescript",
    --   "tsx",
    --   "yaml",
    --   "html",
    --   "css",
    --   "markdown",
    --   "markdown_inline",
    --   "graphql",
    --   "bash",
    --   "lua",
    --   "vimdoc",
    --   "dockerfile",
    --   "gitignore",
    --   "go",
    -- },
    -- auto install above language parsers
    auto_install = true,
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
})


