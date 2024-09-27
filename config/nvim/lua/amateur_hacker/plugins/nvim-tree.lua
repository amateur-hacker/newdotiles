-----------------------------------------------------------
-- Nvim Tree (File Explorer)
-----------------------------------------------------------

return {
  "nvim-tree/nvim-tree.lua",
  -- event = "VeryLazy",
  cmd = "NvimTreeToggle",
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
  },
  opts = function()
    local function custom_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      local function open_or_cd()
        local node = api.tree.get_node_under_cursor()

        if node.type == "directory" then
          api.tree.change_root_to_node(node) -- CD into the folder
        else
          api.node.open.edit(node) -- Open the file
        end
      end

      -- e => Rename: Basename
      -- E => Expand all
      -- W => Collapse all
      -- o => Open

      -- vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      -- vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("CD"))
      vim.keymap.set("n", "h", api.tree.change_root_to_parent, opts("Up"))
      vim.keymap.set("n", "l", open_or_cd, opts("CD or Open"))
      vim.keymap.set("n", "d", api.fs.trash, opts("Trash"))
      vim.keymap.set("n", "D", api.fs.remove, opts("Delete"))
      vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
      vim.keymap.set("n", "c", api.fs.copy.filename, opts("Copy Name"))
      vim.keymap.set("n", "C", api.fs.copy.relative_path, opts("Copy Relative Path"))
      vim.keymap.set("n", "i", api.node.show_info_popup, opts("Info"))
    end

    return {
      on_attach = custom_on_attach,
      filters = {
        dotfiles = false,
      },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        adaptive_size = false,
        side = "left",
        width = 30,
        preserve_window_proportions = true,
      },
      git = {
        enable = true,
        ignore = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        highlight_opened_files = "none",

        indent_markers = {
          enable = true,
        },

        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },

          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    }
  end,
}
