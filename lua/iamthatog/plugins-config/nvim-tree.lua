local setup, nvimTree = pcall(require, 'nvim-tree')

if not setup then
  print('nvim-tree file explorer plugin not installed')
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimTree.setup({
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open        
        }
      }
    }
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  view = {
    -- side = "left",
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "cursor",
        border = "rounded",
        width = 50,
      --   height = 30,
        row = 1,
        col = 1,
      },
    },
  }
})

local function open_nvim_tree()
  -- buffer is a [No Name]
  -- local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  -- local directory = vim.fn.isdirectory(data.file) == 1

  -- if not no_name and not directory then
  --   return
  -- end

  -- change to the directory
  -- if directory then
  --   vim.cmd.cd(data.file)
  -- end

  -- open the tree
  require('nvim-tree.api').tree.open()
end

-- startup nvim-tree on vim start
vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

