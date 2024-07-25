-- Initialize the plugin system
vim.cmd [[call plug#begin()]]

-- Add plugins
vim.cmd [[Plug 'ThePrimeagen/vim-be-good']]

-- End the plugin setup
vim.cmd [[call plug#end()]]

vim.o.relativenumber = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.api.nvim_set_keymap(  't'  ,  '<ESC>'  ,  '<C-\\><C-n>'  ,  {noremap = true}  )

