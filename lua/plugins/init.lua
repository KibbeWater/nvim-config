return {
    { "ThePrimeagen/vim-be-good", lazy = false },
    { "tpope/vim-fugitive", lazy = false },
    { "github/copilot.vim", lazy = false },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        opts = {},
        keys = {
            {
                "<leader>aa",
                function()
                    require("avante.api").ask()
                end,
                desc = "avante: ask",
                mode = { "n", "v" },
            },
            {
                "<leader>ar",
                function()
                    require("avante.api").refresh()
                end,
                desc = "avante: refresh",
            },
            {
                "<leader>ae",
                function()
                    require("avante.api").edit()
                end,
                desc = "avante: edit",
                mode = "v",
            },
        },
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to setup it properly if you have lazy=true
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
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
        "windwp/nvim-ts-autotag",
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = {},
        lazy = true,
        event = "InsertEnter", -- load on insert enter
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
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            autotag = {
                enable = true,
                filetypes = {
                    "html",
                    "javascript",
                    "typescript",
                    "javascriptreact",
                    "typescriptreact",
                    "svelte",
                    "vue",
                    "tsx",
                    "jsx",
                    "rescript",
                    "css",
                    "lua",
                    "xml",
                    "php",
                    "markdown",
                },
            },
        },
    },
}
