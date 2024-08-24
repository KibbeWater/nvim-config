local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    astro = { "prettier", stop_after_first = true },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    prettierd = {
      env = {
        PRETTIERD_DEFAULT_CONFIG = "~/.config/.prettierrc.js",
      },
    },
    prettier = {
      env = {
        PRETTIERD_DEFAULT_CONFIG = "~/.config/.prettierrc.js",
      },
    },
  },
}

require("conform").setup(options)
