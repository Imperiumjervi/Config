return {
  -- Lazy.nvim (gestor de plugins)
  { "folke/lazy.nvim" },

  -- Autopairs para cerrar automáticamente comillas y llaves
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },

  -- Explorador de archivos (como VS Code)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      require("mini.icons").setup()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>") -- Atajo: Ctrl + N
    end,
  },

  -- LSP (Lenguaje Server Protocol)
  { "neovim/nvim-lspconfig" },

  -- Autocompletado
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
  },

  -- scrtip para reconozca java
  {
    "mfussenegger/nvim-jdtls", ft = "java"
  },


  -- Resaltado de sintaxis mejorado (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "cpp", "javascript", "python", "java", "html", "css" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "MunifTanim/nui.nvim",
      "nvim-lua/plenary.nvim",
"echasnovski/mini.icons"
    }
  },

-- al principio o donde agrupes plugins
{
  "echasnovski/mini.icons",
  version = false,
  lazy = false,  -- lo cargamos al inicio para que esté disponible
  config = function()
    require("mini.icons").setup()
  end,
},

}
