vim.g.mapleader = ' '

local keymap = vim.keymap

local telescope_builtin_setup, builtin = pcall(require,'telescope.builtin')

if not telescope_builtin_setup then
  print('telescope builtin for keymaps not setup')
else
  -- telescope maps

  -- Lists files in your current working directory, respects .gitignore
  keymap.set('n', '<leader>ff', builtin.find_files, {})

  -- Searches for the string under your cursor or selection in your current working directory
  keymap.set('n', '<leader>fc', builtin.grep_string, {})

  -- Search for a string in your current working directory and get results live as you type
  -- respects .gitignore
  keymap.set('n', '<leader>fg', builtin.live_grep, {})

  -- Lists open buffers in current neovim instance
  keymap.set('n', '<leader>fb', builtin.buffers, {})

  -- Lists available help tags
  keymap.set('n', '<leader>fh', builtin.help_tags, {})

  -- Lists previously open files
  keymap.set('n', '<leader>fp', builtin.oldfiles, {})

  -- Lists searches that were executed recently, and reruns them on <cr>
  keymap.set('n', '<leader>fs', builtin.search_history, {})
end

-- The Primeagen maps
keymap.set('n', '<leader>bb', vim.cmd.Ex)

keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- move highlighted section up
keymap.set('v', 'K', ":m '<-2<CR>gv=gv") -- move highlighted section down

keymap.set('n', '<C-d>', '<C-d>zz') -- jump lines down
keymap.set("n", "<C-u>", "<C-u>zz") -- jump lines up

keymap.set("n", "n", "nzzzv") -- move up to occurences of search word
keymap.set("n", "N", "Nzzzv") -- move down to occurences of search word

--vim.keymap.set("x", "<leader>p", "\"_dP")
keymap.set("x", "<leader>p", [["_dP]]) -- paste replace after copy

-- others
-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
-- make split windows equal width & height
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- toggle nvim-tree
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- gitsigns
keymap.set('n', '<leader>gs', ':Gitsigns<leader>')

--bufferline
keymap.set('n', 'b<Right>', ':BufferLineCycleNext<CR>')
keymap.set('n', 'b<Left>', ':BufferLineCyclePrev<CR>')
keymap.set('n', 'bn', ':BufferLineMoveNext<CR>')
keymap.set('n', 'bp', ':BufferLineMovePrev<CR>')

