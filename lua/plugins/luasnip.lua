-- import luasnip plugin safely
local luasnip_status, luasnip_vscode = pcall(require, "luasnip.loaders.from_vscode")
if not luasnip_status then
    print("luasnip vscode snippet plugin not installed")
    return
end

luasnip_vscode.lazy_load()
