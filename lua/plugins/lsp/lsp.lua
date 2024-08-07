-- safely import lsp-zero
local lspSetup, lsp = pcall(require, "lsp-zero")

if not lspSetup then
    print("lsp-zero plugin not setup")
    return
end

-- safely import cmpMappings
-- local cmp_mapping_defined, cmp_mapping = pcall(require, 'Users.iamthatog..config.nvim.lua.iamthatog.plugins-config.nvim-cmp')
-- if not cmp_mapping_defined then
--   print('cmp mapping not defined')
-- end

-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    print("nvim-cmp plugin not installed")
    return
end

-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    print("lspconfig plugin not installed")
    return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    print("cmp-nvim-lsp plugin not installed")
    return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    print("luasnip plugin not installed")
    return
end

local keymap = vim.keymap -- for conciseness

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    },
})

local on_attach = function(client, bufnr)
    -- keybind options
    local opts = { remap = false, silent = true, buffer = bufnr }

    -- set keybinds
    keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
    -- keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
    -- keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
    keymap.set("n", "pd", "<cmd>Lspsaga peek_definition<CR>", opts)
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
    keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap.set({ "n", "i" }, "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap.set("n", "<F4>", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    -- keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    keymap.set("n", "<F2>", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    -- keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
    -- keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    -- keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    -- keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
    -- keymap.set('n', '<C-m>', "<cmd>Mason<CR>", opts) -- to open Mason for lsps installation
end

lsp.on_attach(on_attach)

-- used to enable autocompletion (assign to every lsp server config)
-- local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- -- configure html server
-- lspconfig["html"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- -- configure css server
-- lspconfig["cssls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- lspconfig["tsserver"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- -- configure tailwindcss server
-- -- lspconfig["tailwindcss"].setup({
-- --   capabilities = capabilities,
-- --   on_attach = on_attach,
-- -- })

-- -- configure emmet language server
-- lspconfig["emmet_ls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
-- })

-- -- configure lua server (with special settings)
-- lspconfig["lua_ls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   settings = { -- custom settings for lua
--     Lua = {
--       -- make the language server recognize "vim" global
--       diagnostics = {
--         globals = { "vim" },
--       },
--       workspace = {
--         -- make language server aware of runtime files
--         library = {
--           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--           [vim.fn.stdpath("config") .. "/lua"] = true,
--         },
--       },
--     },
--   },
-- })

-- -- configure gopls server
-- lspconfig["gopls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- -- configure prisma language server
-- lspconfig["prismals"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- -- configure omnisharp
-- lspconfig["omnisharp"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   enable_roslyn_analysers = true,
--   enable_import_completion = true,
--   organize_imports_on_format = true,
--   enable_decompilation_support = true,
--   filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets' }
-- })

-- -- configure pylsp server
-- lspconfig['pylsp'].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   settings = {
--     pylsp = {
--       plugins = {
--         autopep8 = {
--           enabled = false
--         },
--         flake8 = {
--           enabled = false
--         },
--         yapf = {
--           enabled = true,
--           args = '--style={based_on_style: google column_limit: 120}'
--         }
--       }
--     }
--   }
-- })

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
