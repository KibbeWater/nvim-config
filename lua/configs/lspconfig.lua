-- NvChad's defaults() already sets up global capabilities and on_init via vim.lsp.config("*", ...)
-- So we just need to enable our servers

local servers = { "html", "cssls", "ts_ls", "eslint", "tailwindcss", "gopls", "marksman", "astro", "sourcekit", "lemminx" }

vim.lsp.enable(servers)
