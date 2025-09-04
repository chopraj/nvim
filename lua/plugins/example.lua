return {
  -- Add kanagawa colorscheme
  { "rebelot/kanagawa.nvim" },

  -- Configure LazyVim to load kanagawa
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },

  -- Better icons with material design
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh"
        }
      },
      color_icons = true,
      default = true,
      strict = true,
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore"
        }
      },
      override_by_extension = {
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log"
        }
      },
    }
  },

  -- Configure Telescope with Cursor-like keybindings
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Cmd+P for file name search (works in normal and insert mode)
      { "<D-p>", "<cmd>Telescope find_files<cr>", desc = "Find files", mode = { "n", "i" } },
      -- Cmd+Shift+F for global text search (works in normal and insert mode)
      { "<D-S-f>", "<cmd>Telescope live_grep<cr>", desc = "Search in all files", mode = { "n", "i" } },
    },
  },

  -- Configure Neo-tree with Cursor-like keybindings and show hidden files
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      -- Cmd+B for file tree toggle (works in normal and insert mode)
      { "<D-b>", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree", mode = { "n", "i" } },
    },
    opts = {
      filesystem = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          show_hidden_count = false,
        },
      },
      default_component_configs = {
        icon = {
          provider = function(icon, node, state)
            if node.type == "file" or node.type == "terminal" then
              local success, web_devicons = pcall(require, "nvim-web-devicons")
              local name = node.type == "terminal" and "terminal" or node.name
              if success then
                local devicon, hl = web_devicons.get_icon(name)
                icon.text = devicon or icon.text
                icon.highlight = hl or icon.highlight
              end
            end
          end,
        },
      },
    },
  },

  -- Add glance.nvim for enhanced go-to-definition with preview panel
  {
    "dnlhc/glance.nvim",
    cmd = "Glance",
    config = true,
  },

}