local nvim_ts_autotag_setup, ts_autotag = pcall(require, "nvim-treesitter.configs")
if not nvim_ts_autotag_setup then
    print("ts_autotag not installed")
    return
end

ts_autotag.setup({
    opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
    },
})
