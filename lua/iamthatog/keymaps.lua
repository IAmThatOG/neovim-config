vim.g.mapleader = ' '

local n_opts = {silent = true, noremap = true}
local t_opts = {silent = true}

local keymap = vim.keymap

local telescope_builtin_setup, builtin = pcall(require,'telescope.builtin')

if not telescope_builtin_setup then
  print('telescope builtin for keymaps not setup')
else
  -- telescope maps

  -- Lists files in your current working directory, respects .gitignore
  keymap.set('n', '<leader>ff', builtin.find_files, n_opts)

  -- Searches for the string under your cursor or selection in your current working directory
  keymap.set('n', '<leader>fc', builtin.grep_string, n_opts)

  -- Search for a string in your current working directory and get results live as you type
  -- respects .gitignore
  keymap.set('n', '<leader>fg', builtin.live_grep, n_opts)

  -- Lists open buffers in current neovim instance
  keymap.set('n', '<leader>fb', builtin.buffers, n_opts)

  -- Lists available help tags
  keymap.set('n', '<leader>fh', builtin.help_tags, n_opts)

  -- Lists previously open files
  keymap.set('n', '<leader>fp', builtin.oldfiles, n_opts)

  -- Lists searches that were executed recently, and reruns them on <cr>
  keymap.set('n', '<leader>fs', builtin.search_history, n_opts)
end

-- The Primeagen maps
keymap.set('n', '<leader>bb', vim.cmd.Ex, n_opts)

keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- move highlighted section up
keymap.set('v', 'K', ":m '<-2<CR>gv=gv") -- move highlighted section down

keymap.set('n', '<C-d>', '<C-d>zz', n_opts) -- jump lines down
keymap.set("n", "<C-u>", "<C-u>zz", n_opts) -- jump lines up

keymap.set("n", "n", "nzzzv", n_opts) -- move up to occurences of search word
keymap.set("n", "N", "Nzzzv", n_opts) -- move down to occurences of search word

--vim.keymap.set("x", "<leader>p", "\"_dP")
keymap.set("x", "<leader>p", [["_dP]]) -- paste replace after copy

-- others
-- window management
keymap.set("n", "<leader>sv", "<C-w>v", n_opts) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", n_opts) -- split window horizontally
-- make split windows equal width & height
keymap.set("n", "<leader>se", "<C-w>=", n_opts)
keymap.set("n", "<leader>sx", ":close<CR>", n_opts) -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>", n_opts) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", n_opts) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", n_opts) --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", n_opts) --  go to previous tab

-- toggle nvim-tree
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', n_opts)

-- gitsigns
keymap.set('n', '<leader>gs', ':Gitsigns<leader>', n_opts)

--bufferline
keymap.set('n', 'b<Right>', ':BufferLineCycleNext<CR>', n_opts)
keymap.set('n', 'b<Left>', ':BufferLineCyclePrev<CR>', n_opts)
keymap.set('n', 'bn', ':BufferLineMoveNext<CR>', n_opts)
keymap.set('n', 'bp', ':BufferLineMovePrev<CR>', n_opts)

-- terminal mode
keymap.set('t', '<esc>', '<C-\\><C-N>', t_opts)
