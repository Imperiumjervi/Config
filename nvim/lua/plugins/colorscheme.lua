return {
    -- 🎭 Tema Dracula
    --{
    --    "Mofiqul/dracula.nvim",
    --    config = function()
    --        vim.cmd.colorscheme("dracula")
    --        vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#50FA7B" })
    --    end
   -- },
   
   -- Catppuccin colorscheme
{
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        notify = true,
        mini = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "DashboardCenter", { bg = "none" })
vim.api.nvim_set_hl(0, "DashboardCenterIcon", { bg = "none" })

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
