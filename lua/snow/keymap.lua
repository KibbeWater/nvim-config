vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true })

-- Insert empty line above or below cursor
vim.api.nvim_set_keymap("n", "<Space>O", "m`O<Esc>``", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>o", "m`o<Esc>``", { noremap = true })

-- Git (vim-fugitive) maps
vim.api.nvim_set_keymap("n", "<Space>ga", ":Git add .<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>gc", ":Git commit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>gp", ":Git push<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>gs", ":Git<CR>", { noremap = true })

-- Window Resizing
vim.api.nvim_set_keymap("n", "=", "<cmd>vertical resize +5<CR>", { noremap = true }) -- Make the window bigger vertically
vim.api.nvim_set_keymap("n", "+", "<cmd>vertical resize -5<CR>", { noremap = true }) -- Make the window smaller vertically
vim.api.nvim_set_keymap("n", "_", "<cmd>horizontal resize +2<CR>", { noremap = true }) -- Make the window bigger horizontally
vim.api.nvim_set_keymap("n", "-", "<cmd>horizontal resize -2<CR>", { noremap = true }) -- Make the window smaller horizontally
