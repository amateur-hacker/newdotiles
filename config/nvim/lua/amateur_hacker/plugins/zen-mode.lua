-----------------------------------------------------------
-- Zen Mode (Distraction free coding and writing)
-----------------------------------------------------------

return {
  "folke/zen-mode.nvim",
  dependencies = { "folke/twilight.nvim" },
  cmd = "ZenMode",
  opts = {
    window = {
      width = 1,
    },
    plugins = {
      twilight = { enabled = false },
      kitty = {
        enabled = true,
        font = "+2",
      },
    },
    on_open = function()
      vim.o.laststatus = 0
    end,
    on_close = function()
      vim.o.laststatus = 3
    end,
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
  },
}
