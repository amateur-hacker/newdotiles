return {
  "michaelrommel/nvim-silicon",
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    {
      "<leader>cc",
      mode = "x",
      function()
        require("nvim-silicon").clip()
      end,
      desc = "Save selected code snapshot into clipboard",
    },
    {
      "<leader>cs",
      mode = "x",
      function()
        require("nvim-silicon").file()
      end,
      desc = "Save selected code snapshot into ~/Pictures/silicon-codesnap",
    },
  },
  opts = {
    font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
    theme = "Catppuccin Mocha",
    tab_width = 2,
    -- background = "#94e2d5",
    output = function()
      return os.getenv("HOME") .. "/pictures/silicon-codesnap/" .. os.date("%Y-%m-%dT%I-%M-%S%p") .. "_code.png"
    end,
    window_title = function()
      return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ":~:.")
    end,
  },
  config = function(_, opts)
    require("nvim-silicon").setup(opts)
  end,
}
