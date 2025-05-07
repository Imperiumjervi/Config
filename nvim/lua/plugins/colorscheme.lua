return {
    -- 🎭 Tema Dracula
    {
        "Mofiqul/dracula.nvim",
        config = function()
            vim.cmd.colorscheme("dracula")
            vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#50FA7B" })
        end
    },

    -- 🌫️ Fondo transparente
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({
                extra_groups = {
                    "NormalFloat",
                    "NvimTreeNormal",
                },
            })
        end,
    },
}
