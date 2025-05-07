-- 1. Configura el path para Lazy.nvim ANTES de todo
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Ahora carga las configuraciones básicas
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.utils")
require("config.create_workspace")
require("config.git")


-- 3. Finalmente inicializa Lazy.nvim
require("lazy").setup("plugins", {
  ui = {
    -- Si quieres asegurarte que la UI se vea
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
    },
  }
})
