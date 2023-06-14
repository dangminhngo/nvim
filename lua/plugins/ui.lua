return {
  --- Statusbar
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = require("config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "▙", right = "▜" },
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, symbols = { modified = " 󰛿 ", readonly = "", unnamed = "" } },
          },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = fg("Statement")
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = fg("Constant") ,
            },
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            {
              "branch",
              icon = "󰘬",
            },
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },

  -- active indent guide and indent text objects
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      -- symbol = "│",
      symbol = "╎",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  -- Starter
  {
    "echasnovski/mini.starter",
    version = false,
    opts = {
      header = [[
██████████    ████████████████████████
  ██████████    ████████████████████████
    ██████████    ████████████████████████
      ██████████    ██████████    ██████████
        ██████████    ██████████   ███████████
        ██████████    ██████████   ███████████
      ██████████    ██████████    ██████████
    ██████████    ██████████    ██████████
  ██████████    ██████████    ██████████
██████████    ██████████    ██████████
      ]],
      items = nil,
      footer = nil,
    },
  },
  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      override_by_filename = require("config").devicons.filename,
      override_by_extension = require("config").devicons.extension,
    },
  },

  -- UI components (need for neo-tree)
  { "MunifTanjim/nui.nvim", lazy = true },
}
