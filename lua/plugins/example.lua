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
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules/",
          "node_modules/**",
          ".git/",
          ".git/**",
          "dist/",
          "dist/**",
          "build/",
          "build/**",
          "target/",
          "target/**",
          ".cache/",
          ".cache/**",
          ".npm/",
          ".npm/**",
          "%.DS_Store",
          "%.log",
          "%.tmp",
          "%.temp",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
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

  -- Disable snacks.nvim indent guides
  {
    "folke/snacks.nvim", 
    opts = {
      indent = { enabled = false }
    }
  },

  -- Add glance.nvim for enhanced go-to-definition with preview panel
  {
    "dnlhc/glance.nvim",
    cmd = "Glance",
    config = function()
      require('glance').setup({
        height = 18,
        zindex = 45,
        preview_win_opts = {
          cursorline = true,
          number = true,
          wrap = false,
        },
        list = {
          position = 'right',
          width = 0.33,
        },
        theme = {
          enable = true,
          mode = 'auto',
        },
        mappings = {
          list = {
            ['j'] = require('glance').actions.next,
            ['k'] = require('glance').actions.previous,
            ['<Down>'] = require('glance').actions.next,
            ['<Up>'] = require('glance').actions.previous,
            ['<Tab>'] = require('glance').actions.next_location,
            ['<S-Tab>'] = require('glance').actions.previous_location,
            ['<C-u>'] = require('glance').actions.preview_scroll_win(5),
            ['<C-d>'] = require('glance').actions.preview_scroll_win(-5),
            ['v'] = require('glance').actions.jump_vsplit,
            ['s'] = require('glance').actions.jump_split,
            ['t'] = require('glance').actions.jump_tab,
            ['<CR>'] = require('glance').actions.jump,
            ['o'] = require('glance').actions.jump,
            ['<leader>l'] = require('glance').actions.enter_win('preview'),
            ['q'] = require('glance').actions.close,
            ['Q'] = require('glance').actions.close,
            ['<Esc>'] = require('glance').actions.close,
          },
          preview = {
            ['Q'] = require('glance').actions.close,
            ['<Tab>'] = require('glance').actions.next_location,
            ['<S-Tab>'] = require('glance').actions.previous_location,
            ['<leader>l'] = require('glance').actions.enter_win('list'),
          },
        },
        hooks = {
          before_open = function(results, open, jump, method)
            -- If only one result and it's in the current buffer, just jump directly
            if #results == 1 then
              local uri = vim.uri_from_bufnr(0)
              local target_uri = results[1].uri or results[1].targetUri

              if target_uri == uri then
                jump(results[1])
              else
                open(results)
              end
            else
              open(results)
            end
          end,
        },
      })
    end,
  },

}