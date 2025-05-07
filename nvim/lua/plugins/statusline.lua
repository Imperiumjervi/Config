return {
    -- 🎛️ Lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup { options = { theme = "dracula" } }
        end
    },
}
