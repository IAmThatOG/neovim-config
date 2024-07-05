-- import telescope safely
local telescope_setup, telescope = pcall(require, "telescope")

if not telescope_setup then
    print("telescope plugin not installed")
    return
end

-- import telescope actions safely
local action_setup, actions = pcall(require, "telescope.actions")

if not action_setup then
    print("telescope.action plugin not installed")
    return
end

-- configure telescope
telescope.setup({
    extensions = {
        file_browser = {
            hijack_netrw = true,
            hidden = { file_browser = true, folder_browser = true },
            no_ignore = true,
        },
    },
    pickers = {
        find_files = {
            hidden = false,
        },
    },
    -- configure custom mappings
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
            },
        },
    },
})

telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("harpoon")
telescope.load_extension("neoclip")
