-----------------------------------------------------------
-- Define keymaps of Neovim
-----------------------------------------------------------

-- Change leader and local leader to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function merge_opts(...)
  local combined_opts = {}
  for _, tbl in ipairs({ ... }) do
    for key, value in pairs(tbl) do
      combined_opts[key] = value
    end
  end
  return combined_opts
end

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Delete single character without copying into register
map("n", "x", '"_x')

-- Paste without losing the contents of the register
map({ "v", "x" }, "p", '"_dP')

-- Insert mode navigation
map("i", "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move End of line" })
map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-l>", "<Right>", { desc = "Move Right" })
map("i", "<C-j>", "<Down>", { desc = "Move Down" })
map("i", "<C-k>", "<Up>", { desc = "Move Up" })

-- Increment/Decrement number
map("n", "=", "<C-a>", { desc = "Increment by 1" })
map("n", "-", "<C-x>", { desc = "Decrement by 1" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move selected line/block of text in visual mode
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Split window
map("n", "_", "<cmd>split<cr>", merge_opts(opts, { desc = "Split window vertically" }))
map("n", "|", "<cmd>vsplit<cr>", merge_opts({ desc = "Split window horizontally" }))

-- Clear search highlights
map("n", "<leader>nh", "<cmd>nohl<cr>", merge_opts(opts, { desc = "Clear hlsearch" }))
map({ "i", "n" }, "<esc>", "<cmd>nohl<cr><esc>", merge_opts(opts, { desc = "Escape and Clear hlsearch" }))

-- Copy file
map("n", "<leader>y", "<cmd>%y+<cr>", merge_opts(opts, { desc = "Copy whole File" }))

-- lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", merge_opts(opts, { desc = "Lazy" }))

-- save file
map("n", "<leader>s", "<cmd>silent write<cr><esc>", merge_opts(opts, { desc = "Save File" }))

-- Toggle Inlay Hints
map("n", "<leader>i", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, merge_opts(opts, { desc = "Toggle Inlay Hints" }))

-- Buffer Movements
map("n", "H", "<cmd>bprevious<cr>", merge_opts(opts, { desc = "Previous Buffer" }))
map("n", "L", "<cmd>bnext<cr>", merge_opts(opts, { desc = "Next Buffer" }))

-- Close tabs
map("n", "<leader>sx", "<cmd>close<CR>", merge_opts(opts, { desc = "Close current split" }))

-- window management
map("n", "<leader>sv", "<C-w>v", merge_opts(opts, { desc = "Split window vertically" })) -- split window vertically
map("n", "<leader>sh", "<C-w>s", merge_opts(opts, { desc = "Split window horizontally" })) -- split window horizontally
map("n", "<leader>se", "<C-w>=", merge_opts(opts, { desc = "Make splits equal size" })) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", merge_opts(opts, { desc = "Close current split" })) -- close current split window
