return {
    { "ThePrimeagen/vim-be-good", lazy = false },
    { "tpope/vim-fugitive", lazy = false },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "html-lsp",
                "css-lsp",
                "gopls",
                "prettierd",
                "tailwindcss-language-server",
                "typescript-language-server",
                "marksman",
                "mdx-analyzer",
                "astro-language-server",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "editorconfig",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "go",
                "markdown",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup {
                opts = {
                    enable_close = true, -- Auto close tags
                    enable_rename = true, -- Auto rename tags
                    enable_close_on_slash = false, -- Auto close on trailing </
                },
            }
        end,
        event = "InsertEnter", -- Lazy load on Insert mode
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        build = "make",
        cond = function()
            return require("snow.settings").enable_ai
        end,
        opts = {
            provider = "opencode",
            acp_providers = {
                ["opencode"] = {
                    command = "opencode",
                    args = { "acp" },
                },
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
            {
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        use_absolute_path = true,
                    },
                },
            },
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
}
