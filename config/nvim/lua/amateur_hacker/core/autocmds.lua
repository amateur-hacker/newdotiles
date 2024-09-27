-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "120" })
  end,
})

-- Remove whitespace on save
-- autocmd("BufWritePre", {
--   pattern = "",
--   command = ":%s/\\s\\+$//e",
-- })

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})

-- Syntax highlighting for ejs files
autocmd({ "BufNewFile", "BufReadPre" }, {
  pattern = "*.ejs",
  callback = function()
    vim.opt_local.filetype = "html"
  end,
})

-- Resize splits if window got resized
autocmd("VimResized", {
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Delete empty and unamed buffer
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local buffers = vim.api.nvim_list_bufs()

    for _, bufnr in ipairs(buffers) do
      if
        vim.api.nvim_buf_is_loaded(bufnr)
        and vim.api.nvim_buf_get_name(bufnr) == ""
        and vim.api.nvim_buf_get_option(bufnr, "buftype") == ""
      then
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        local total_characters = 0
        for _, line in ipairs(lines) do
          total_characters = total_characters + #line
        end
        if total_characters == 0 then
          vim.api.nvim_buf_delete(bufnr, { force = true })
        end
      end
    end
  end,
})

-- Set filetype for image files
autocmd("BufReadPre", {
  pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.filetype = "image"
  end,
})

-- Fix conceallevel for json files
autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- wrap and check for spell in text filetypes
autocmd("FileType", {
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- reload kitty terminal automatically on save
autocmd("BufWritePost", {
  pattern = "kitty.conf",
  command = "silent !reload-kitty",
})

-- unset some options for terminal
autocmd("TermOpen", {
  command = "setlocal listchars= nonumber norelativenumber nocursorline filetype=terminal",
})

-- automatically close terminal on exit
autocmd("TermClose", {
  pattern = "term://*",
  callback = function()
    vim.api.nvim_input("<cr>")
  end,
})

autocmd("VimLeave", {
  pattern = "*",
  command = "set guicursor=a:hor20",
})
