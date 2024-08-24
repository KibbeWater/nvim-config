vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true })

-- Insert empty line above or below cursor
vim.api.nvim_set_keymap("n", "<Space>O", "m`O<Esc>``", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>o", "m`o<Esc>``", { noremap = true })

-- Git (vim-fugitive) maps
vim.api.nvim_set_keymap("n", "<Space>ga", ":Git add .<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>gc", ":Git commit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>gp", ":Git push<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>gs", ":Git<CR>", { noremap = true })
