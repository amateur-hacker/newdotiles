-----------------------------------------------------------
-- Bufferline (tabline)
-----------------------------------------------------------

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  event = { "BufReadPre", "BufNewFile", "TermOpen" },
  keys = {
    { "H", "<cmd>BufferLineCyclePrev<cr>", desc = "Go to Previous Buffer" },
    { "L", "<cmd>BufferLineCycleNext<cr>", desc = "Go to Next Buffer" },
  },
  opts = {
    options = {
      -- mode = "tabs",
      separator_style = "slant",
      offsets = {
        { filetype = "NvimTree" },
      },
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      sort_by = "insert_at_end",
    },
  },
}
