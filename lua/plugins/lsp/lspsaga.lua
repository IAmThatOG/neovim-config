-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    print("lspsaga plugin not installed")
    return
end

saga.setup({
    -- keybinds for navigation in lspsaga window
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    -- use enter to open file with definition preview
    definition = {
        keys = {
            edit = "<CR>",
            quit = "<ESC>",
            close = "<ESC>",
        },
    },
    ui = {
        colors = {
            normal_bg = "#022746",
        },
    },
    finder = {
        keys = {
            shuttle = "<C-w>",
            quit = "<ESC>",
            close = "<ESC>",
            toggle_or_open = "<CR>",
        },
    },
    symbol_in_winbar = {
        folder_level = 4,
    },
    outline = {
        keys = {
            toggle_or_jump = "<CR>",
            quit = "<ESC>",
            jump = "<C-d>",
        },
    },
    rename = {
        keys = {
            quit = "<ESC>",
        },
    },
    diagnostic = {
        keys = {
            quit = "<ESC>",
            exec_action = "<CR>",
            toggle_or_jump = "e",
        },
    },
})
