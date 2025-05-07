return {
    -- 🖥️ Terminal flotante
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                shell = "zsh",
            })
        end
    },
}
