return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
      if diagnostic.message:find("Error: Could not find config file") then
        ---@diagnostic disable-next-line: return-type-mismatch
        return nil
      end
      return diagnostic
    end)

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      -- sh = { "shellcheck" },
      python = { "pylint" },
      markdown = { "markdownlint-cli2" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
  keymaps = {
    {
      "<leader>l",
      function()
        require("lint").try_lint()
      end,
      desc = "Trigger linting for current file",
    },
  },
}
