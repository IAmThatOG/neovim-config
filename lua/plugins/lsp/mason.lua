-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

mason.setup({})

-- safely import lsp-zero
local lspSetup, lsp_zero = pcall(require, "lsp-zero")

if not lspSetup then
    print("lsp-zero plugin not setup")
    return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    print("lspconfig plugin not installed")
    return
end

mason_lspconfig.setup({
    handlers = {
        function(server_name)
            if server_name == "omnisharp" then
                lspconfig[server_name].setup({
                    enable_roslyn_analysers = true,
                    enable_import_completion = true,
                    organize_imports_on_format = true,
                    enable_decompilation_support = true,
                    filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "targets" },
                })
            elseif server_name == "lua_ls" then
                lspconfig[server_name].setup({
                    settings = {
                        Lua = {},
                    },
                    on_init = function(client)
                        -- local uv = vim.uv or vim.loop
                        -- local path = client.workspace_folders[1].name

                        -- Don't do anything if there is a project local config
                        -- if uv.fs_stat(path .. '/.luarc.json')
                        --   or uv.fs_stat(path .. '/.luarc.jsonc')
                        -- then
                        --   return
                        -- end

                        -- Apply neovim specific settings
                        local lua_opts = lsp_zero.nvim_lua_ls()

                        client.config.settings.Lua =
                            vim.tbl_deep_extend("force", client.config.settings.Lua, lua_opts.settings.Lua)
                    end,
                })
            elseif server_name == "pylsp" then
                lspconfig["pylsp"].setup({
                    settings = {
                        pylsp = {
                            plugins = {
                                autopep8 = {
                                    enabled = false,
                                },
                                flake8 = {
                                    enabled = false,
                                },
                                yapf = {
                                    enabled = true,
                                    args = "--style={based_on_style: google column_limit: 120}",
                                },
                            },
                        },
                    },
                })
            elseif server_name == "emmet_ls" then
                lspconfig["emmet_ls"].setup({
                    filetypes = {
                        "html",
                        "typescriptreact",
                        "javascriptreact",
                        "css",
                        "sass",
                        "scss",
                        "less",
                        "svelte",
                    },
                })
            else
                lspconfig[server_name].setup({})
            end
        end,
    },
})
