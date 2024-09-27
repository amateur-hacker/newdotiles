return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = { "BufReadPost", "BufNewFile" },
    -- init = function()
    --   vim.o.foldenable = true
    --   vim.o.foldcolumn = "auto:9"
    --   vim.o.foldlevel = 99
    --   vim.o.foldlevelstart = 99
    --   vim.o.fillchars = "eob: ,fold: ,foldopen:,foldsep:│,foldclose:"
    --   -- vim.o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:"
    -- end,
    opts = function()
      vim.api.nvim_set_hl(0, "UfoFoldedEllipsis", { bg = "none", fg = "#cdd6f4" })
      return {
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      }
    end,
    -- stylua: ignore
    keys = {
      {"zR", function() require("ufo").openAllFolds() end, desc = "Open all folds"},
      {"zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds"},
      {"zK", function()
        local windid = require("ufo").peekFoldedLinesUnderCursor()
        if not windid then
          vim.lsp.buf.hover()
        end
      end, desc = "Peek Fold"},
    },
  },

  {
    "razak17/tailwind-fold.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "astro", "typescriptreact", "javascriptreact" },
  },

  {
    "luukvbaal/statuscol.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      local builtin = require("statuscol.builtin")
      return {
        setopt = true,
        -- override the default list of segments with:
        -- number-less fold indicator, then signs, then line number & separator
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          { text = { "%s" }, click = "v:lua.ScSa" },
          {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
        },
      }
    end,
  },
}
