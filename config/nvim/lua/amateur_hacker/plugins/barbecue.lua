return {
  "utilyre/barbecue.nvim",
  enabled = false,
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    show_dirname = false,
  },
}
