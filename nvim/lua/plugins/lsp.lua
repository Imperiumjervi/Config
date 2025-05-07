return {
    -- 🏗️ LSP servers
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").clangd.setup { cmd = { "clangd", "--compile-commands-dir=./" } }
            require("lspconfig").ts_ls.setup {}
            require("lspconfig").pyright.setup {}
            require("lspconfig").jdtls.setup {}
            require("lspconfig").html.setup {}
        end
    },

    -- 🎨 LSP Colors
    {
        "folke/lsp-colors.nvim",
        config = function()
            require("lsp-colors").setup()
        end
    },

    -- 🧯 Trouble
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup{}
        end
    },

    -- 🧾 LSP Lines flotantes (sin virtual_text)
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
            vim.diagnostic.config({
                virtual_text = false,
                virtual_lines = true,
            })
        end,
    },

    -- 📦 Mason
    {
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
        end
    },
}
