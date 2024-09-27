return {
  -- icons for most of programming languages
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = function()
      return {
        override = require("amateur_hacker.plugins.configs.devicons"),
      }
    end,
  },

  -- lua functions that many plugins use
  "nvim-lua/plenary.nvim",

  -- tmux & split window navigation
  "christoomey/vim-tmux-navigator",
}
