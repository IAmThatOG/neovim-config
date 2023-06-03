-- import telescope safely
local telescope_setup, telescope = pcall(require, 'telescope')

if not telescope_setup then
  print('telescope plugin not installed')
  return
end

-- import telescope actions safely
local action_setup, actions = pcall(require, 'telescope.actions')

if not action_setup then
  print('telescope.action plugin not installed')
  return
end

-- configure telescope
telescope.setup(
  {
    pickers = {
      find_files = {
        hidden = true
      }
    }
  -- configure custom mappings
  -- defaults = {
  --   mappings = {
  --     i = {
  --       ["<C-k>"] = actions.move_selection_previous, -- move to prev result
  --       ["<C-j>"] = actions.move_selection_next, -- move to next result
  --       -- send selected to quickfixlist
  --       ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, 
  --     },
  --   },
  -- }
  }
)

-- telescope.load_extension("fzf")

