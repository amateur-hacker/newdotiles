-----------------------------------------------------------
-- Outline (Code Outline Sidebar)
-----------------------------------------------------------

return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = "Outline",
  opts = {
    -- symbols = { filter = { "Function", "Class" } },
    symbols = { filter = { "Variable", exclude = true } },
  },
  keys = {
    { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle Outline" },
  },
}
