-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    print("nvim-cmp plugin not installed")
    return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    print("luasnip plugin not installed")
    return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    print("lspkind plugin not installed")
    return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

local cmp_select = {
    behavior = cmp.SelectBehavior.Select,
}

local lspSetup, lsp = pcall(require, "lsp-zero")
local cmp_action = lsp.cmp_action()

local cmp_mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select), -- Scroll up in the completion documentation
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select), -- Scroll down in the completion documentation
    ["<C-b>"] = cmp_action.luasnip_jump_backward(), -- Navigate backward between snippet placeholder
    ["<C-f>"] = cmp_action.luasnip_jump_forward(), -- Navigate forward between snippet placeholder
    ["<C-Space>"] = cmp.mapping.complete(), -- Ctrl+Space to trigger completion menu
    -- ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- `Enter` key to confirm completion
    ["<Tab>"] = nil,
    ["<S-Tab>"] = nil,
}

cmp.setup({
    mapping = cmp.mapping.preset.insert(cmp_mapping),
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    -- sources for autocompletion
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" }, -- snippets
        { name = "nvim_lsp_signature_help" }, -- function signatures
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
    }),
    -- configure lspkind for vs-code like icons
    formatting = {
        format = lspkind.cmp_format({
            mode = "text_symbol",
            maxwidth = 50,
            ellipsis_char = "...",

            before = function(entry, vim_item)
                return vim_item
            end,
        }),
    },
})
