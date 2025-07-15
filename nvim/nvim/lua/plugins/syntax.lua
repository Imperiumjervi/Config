return {
    -- 🎨 Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "cpp", "javascript", "python", "lua", "html", "css", "java" },
                highlight = { enable = true }
            }
        end
    },
}
