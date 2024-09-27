-----------------------------------------------------------
-- Git Integration
-----------------------------------------------------------

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {},
  keys = {
    { "]h", "<cmd>Gitsigns next_hunk<CR>", desc = "Next Hunk" },
    { "[h", "<cmd>Gitsigns prev_hunk<CR>", desc = "Prev Hunk" },
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
    { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle current blame line" },
  },
}
