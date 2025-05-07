return {
    -- 🧹 Formatter
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                format_on_save = { timeout_ms = 500, lsp_fallback = true },
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "black" },
                    javascript = { "prettier" },
                    cpp = { "clang-format" },
                    java = { "google-java-format" },
                },
            })
        end
    },
}
