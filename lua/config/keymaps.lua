local n_opts = { silent = true, noremap = true }
local t_opts = { silent = true }

local keymap = vim.keymap

-- Telescope config
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", n_opts)
-- Open telescope file explorer to browse files
keymap.set("n", "<leader>e", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR><ESC>", n_opts)
-- Searches for the string under your cursor or selection in your current working directory
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", n_opts)
-- Search for a string in your current working directory and get results live as you type (respects .gitignore)
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", n_opts)
-- Lists open buffers in current neovim instance
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", n_opts)
-- Lists available help tags
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", n_opts)
-- Lists previously open files
keymap.set("n", "<leader>fp", "<cmd>Telescope oldfiles<CR>", n_opts)
-- Lists searches that were executed recently, and reruns them on <cr>
keymap.set("n", "<leader>fs", "<cmd>Telescope search_history<CR>", n_opts)

-- The Primeagen maps
keymap.set("n", "<leader>bb", vim.cmd.Ex, n_opts)

keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move highlighted section up
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move highlighted section down

keymap.set("n", "<C-d>", "<C-d>zz", n_opts) -- jump lines down
keymap.set("n", "<C-u>", "<C-u>zz", n_opts) -- jump lines up

keymap.set("n", "n", "nzzzv", n_opts) -- move up to occurences of search word
keymap.set("n", "N", "Nzzzv", n_opts) -- move down to occurences of search word

-- keymap.set("x", "p", "\"_dp") -- to continue pasting last copied tet

keymap.set("n", "Q", "<nop>", n_opts)

keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- for replacing current character under cursor in file

-- others
-- window management
keymap.set("n", "<leader>sv", "<C-w>v", n_opts) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", n_opts) -- split window horizontally
-- make split windows equal width & height
keymap.set("n", "<leader>se", "<C-w>=", n_opts)
keymap.set("n", "<leader>sx", "<cmd>close<CR>", n_opts) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", n_opts) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", n_opts) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", n_opts) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", n_opts) --  go to previous tab

-- toggle nvim-tree
-- keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', n_opts)

-- gitsigns
keymap.set("n", "<leader>gs", ":Gitsigns<leader>", n_opts)

--bufferline
keymap.set("n", "bl", "<cmd>BufferLineCycleNext<CR>", n_opts)
keymap.set("n", "bh", "<cmd>BufferLineCyclePrev<CR>", n_opts)
keymap.set("n", "b<Right>", "<cmd>BufferLineMoveNext<CR>", n_opts)
keymap.set("n", "b<Left>", "<cmd>BufferLineMovePrev<CR>", n_opts)
keymap.set("n", "bd", "<cmd>bdelete!<CR>", n_opts)

-- terminal mode
keymap.set("t", "<esc>", "<C-\\><C-N>", t_opts)
keymap.set({ "n", "t" }, "<C-t>", "<cmd>Lspsaga term_toggle<CR>", n_opts) -- terminal mode using Lspsaga

-- format code
keymap.set("n", "F", "<cmd>Neoformat<CR>", t_opts)

-- prevent copy on delete
keymap.set("n", "d", '"_x')
keymap.set("v", "d", '"_x')

-- mason package manager
keymap.set("n", "M", "<cmd>Mason<CR>", n_opts)
