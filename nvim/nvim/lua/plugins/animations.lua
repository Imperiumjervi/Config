return {
  "gen740/SmoothCursor.nvim",
  event = "VeryLazy",
  config = function()
    require("smoothcursor").setup({
      type = "default", -- otros: 'matrix', 'railgun', 'sonic', 'trail'
      fancy = {
        enable = true, -- usa cola animada
        head = { cursor = "➤", color = "red" },
        body = {
          { cursor = "•", color = "orange" },
          { cursor = "•", color = "yellow" },
          { cursor = "-", color = "green" },
          { cursor = "-", color = "blue" },
          { cursor = ".", color = "purple" },
        },
        tail = { cursor = nil, color = "magenta" },
      },
    })
  end,
}

