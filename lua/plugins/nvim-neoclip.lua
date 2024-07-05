local neoclip_setup, neoclip = pcall(require, "neoclip")

if not neoclip_setup then
    print("telescope plugin not installed")
    return
end

neoclip.setup()

vim.keymap.set("n", "<leader>y", ":Telescope neoclip<CR>", { silent = true, noremap = true })
