-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

local g = vim.g
local opt = vim.opt

-- Editor Behavior
opt.mouse = "" -- Disable mouse support
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard but not in ssh
opt.swapfile = false -- Disable swap file
opt.completeopt = "menu,menuone,noselect" -- Completion options
opt.shell = "bash" -- Set default shell to fish
opt.confirm = true -- Confirm to save changes
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Command history limit
opt.lazyredraw = false -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- Faster completion (ms)
opt.timeoutlen = 300 -- Time to wait for mapped sequence

-- Interface
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.showmatch = false -- Highlight matching parenthesis
opt.cursorline = true -- Highlight the current line
opt.cursorlineopt = "number" -- Highlight line number only
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.termguicolors = true -- True color support
opt.laststatus = 3 -- Global status line
opt.showcmd = false -- Disable command in last line
opt.showtabline = 0 -- Disable tabline
opt.signcolumn = "yes" -- Always show sign column
opt.fillchars = { -- Customize fill characters
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.shortmess:append("sI") -- Disable startup message
opt.shortmess:append({ W = true, I = true, c = true, C = true }) -- Suppress extra messages
opt.winminwidth = 5 -- Minimum window width
opt.pumblend = 10 -- Popup blend transparency
opt.pumheight = 10 -- Popup menu height
-- opt.list = true -- Show invisible characters
opt.wrap = false -- Disable line wrap

-- Search and Navigation
opt.ignorecase = true -- Ignore case in search
opt.smartcase = true -- Case-sensitive if uppercase present
opt.linebreak = true -- Wrap lines at word boundary
opt.scrolloff = 4 -- Minimum lines to keep above/below
opt.sidescrolloff = 8 -- Minimum columns to keep left/right
opt.jumpoptions = "view" -- Remember view when jumping
opt.inccommand = "nosplit" -- Live preview of command effects
opt.whichwrap:append("<>[]hl") -- Allow movement keys to wrap

-- Folds
-- opt.foldmethod = "marker" -- Folding method (marker)
opt.foldcolumn = "1" -- Fold column width
opt.foldlevel = 99 -- Set fold level
opt.foldlevelstart = 99 -- Start with all folds open
opt.foldenable = true -- Enable folding

-- Text Formatting
opt.formatoptions = "jcroqlnt" -- Text formatting options
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Shift width for autoindent
opt.tabstop = 2 -- Number of spaces per tab
opt.smartindent = true -- Smart autoindenting

-- Spell Checking
opt.spelllang = { "en" } -- Set spellcheck language
opt.spelloptions:append("noplainbuffer") -- Disable spellcheck in plaintext

-- File Encoding
opt.encoding = "utf-8" -- String encoding to use
opt.fileencoding = "utf-8" -- File encoding to use

-- Undo and Backup
opt.undofile = true -- Save undo history
opt.undolevels = 10000 -- Maximum number of undo levels

-- Window Splitting
opt.splitright = true -- Vertical splits open to the right
opt.splitbelow = true -- Horizontal splits open below

-- Miscellaneous
opt.title = false -- Set window title
opt.smoothscroll = true -- Smooth scrolling
opt.virtualedit = "block" -- Allow virtual editing in block mode
opt.grepformat = "%f:%l:%c:%m" -- Grep format
opt.grepprg = "rg --vimgrep" -- Grep program
-- opt.sessionoptions = { -- Session options
--   "blank",
--   "buffers",
--   "curdir",
--   "tabpages",
--   "winsize",
--   "help",
--   "globals", -- nvim tree lazy loading issue
--   "skiprtp",
--   "folds",
--   "terminal",
-- }
opt.wildmode = "longest:full,full" -- Command-line completion mode

vim.filetype.add({
  extension = { mdx = "markdown.mdx" },
})

-- Disable Default Language Providers
g["loaded_node_provider"] = 0 -- Disable Node.js provider
g["loaded_python3_provider"] = 0 -- Disable Python3 provider
g["loaded_perl_provider"] = 0 -- Disable Perl provider
g["loaded_ruby_provider"] = 0 -- Disable Ruby provider
g["markdown_recommended_style"] = 0 -- Fix markdown indentation settings

-- vim.lsp.inlay_hint.enable() -- Enable Inlay Hints (By Default)
