-----------------------------------------------------------
-- Conform ( formatter )
-----------------------------------------------------------

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = function()
    local options = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        sh = { "shfmt" },
        ["markdown"] = { "prettierd", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "prettierd", "markdownlint-cli2", "markdown-toc" },
        -- ["markdown"] = { "prettierd",  "markdown-toc" },
        -- ["markdown.mdx"] = { "prettierd", "markdown-toc" },
        ["_"] = { "trim_whitespace" },
      },

      formatters = {
        black = {
          prepend_args = { "--fast" },
          timeout_ms = 5000,
        },
        isort = {
          timeout_ms = 5000,
        },
        ["markdown-toc"] = {
          condition = function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
              if line:find("<!%-%- toc %-%->") then
                return true
              end
            end
          end,
        },
        ["markdownlint-cli2"] = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
              return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
          end,
        },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }

    local filetypes_prettierd_required = {
      "javascript",
      "typescript",
      "css",
      "html",
      "javascriptreact",
      "typescriptreact",
      "json",
      "yaml",
    }

    for _, ftpr in ipairs(filetypes_prettierd_required) do
      options.formatters_by_ft[ftpr] = { "prettierd" }
    end

    return options
  end,
}
