-----------------------------------------------------------
-- Markdown Preview (for browser and editor)
-----------------------------------------------------------

return {
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "norg", "rmd", "org" },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      -- Map the <leader>um key to toggle Markdown rendering
      require("render-markdown").setup(opts)
      vim.keymap.set("n", "<leader>um", function()
        local m = require("render-markdown")

        if require("render-markdown.state").enabled then
          m.disable() -- Disable rendering
          print("Markdown rendering disabled")
        else
          m.enable() -- Enable rendering
          print("Markdown rendering enabled")
        end
      end, { desc = "Toggle Markdown Rendering" })
    end,
  },
}
