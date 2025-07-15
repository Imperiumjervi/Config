return {
  -- 🖥️ Terminal flotante
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        shell = "zsh",
        open_mapping = nil,
      })

      -- Mapeo para abrir el terminal
      vim.keymap.set("n", "<F2>", "<cmd>ToggleTerm<CR>", { desc = "Abrir terminal" })
      vim.keymap.set("t", "<F3>", "<cmd>ToggleTerm<CR>", { desc = "Cerrar terminal" })
    end
  },
}
