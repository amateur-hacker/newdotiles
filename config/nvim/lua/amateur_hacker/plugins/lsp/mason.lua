return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonLog", "MasonUninstall", "MasonUninstallAll", "MasonUpdate" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "vtsls",
        "lua_ls",
        "emmet_ls",
        "pyright",
        "bashls",
        "csharp_ls",
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettierd",
        "eslint_d",
        "stylua",
        "isort",
        "black",
        "pylint",
        "shfmt",
        "shellcheck",
        "markdownlint-cli2",
        "markdown-toc",
      },
      auto_update = true,
    })
  end,
  keys = {
    { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
  },
}
