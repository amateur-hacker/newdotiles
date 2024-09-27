-----------------------------------------------------------
-- Nvim BufDel (Improve Buffer Deletion)
-----------------------------------------------------------

return {
  "ojroques/nvim-bufdel",
  command = "BufDel",
  keys = {
    {
      "Q",
      "<cmd>BufDel<CR>",
      desc = "Delete Buffer",
    },
  },
  opts = {
    quit = false,
    next = "tabs",
  },
}
