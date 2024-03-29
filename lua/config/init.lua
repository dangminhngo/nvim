---@type LazyVimConfig
local M = {}

M.lazy_version = ">=9.1.0"

---@class LazyVimConfig
local defaults = {
  -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
  ---@type string|fun()
  colorscheme = function()
    require("crux").load()
  end,
  -- load the default settings
  defaults = {
    autocmds = true, -- config.autocmds
    keymaps = true, -- config.keymaps
    -- config.options can't be configured here since that's loaded before lazyvim setup
    -- if you want to disable loading options, add `package.loaded["config.options"] = true` to the top of your init.lua
  },
  -- icons used by other plugins
  icons = {
    dap = {
      Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint = " ",
      BreakpointCondition = " ",
      BreakpointRejected = { " ", "DiagnosticError" },
      LogPoint = ".>",
    },
    diagnostics = {
      Error = "󰻕 ",
      Warn = "󰈻 ",
      Hint = "󰌵 ",
      Info = "󱗆 ",
    },
    git = {
      added = "󰐖 ",
      modified = "󰏬 ",
      removed = "󰍵 ",
    },
    kinds = {
      Array = "󰅪 ",
      Boolean = "󰨙 ",
      Class = "󰙅 ",
      Color = "󰏘 ",
      Constant = "󰐀 ",
      Constructor = "󰖵 ",
      Copilot = "󰊤 ",
      Enum = "󰸼 ",
      EnumMember = "󰸿 ",
      Event = "󰈸 ",
      Field = "󰆧 ",
      File = "󰈔 ",
      Folder = "󰉋 ",
      Function = "󰊕 ",
      Interface = "󱘖 ",
      Key = "󰌆 ",
      Keyword = "󰌋 ",
      Method = "󰊕 ",
      Module = "󰏗 ",
      Namespace = "󰏖 ",
      Null = "󰱥 ",
      Number = "󰲠 ",
      Object = "󰠱 ",
      Operator = "󰿉 ",
      Package = "󰏓 ",
      Property = "󰆦 ",
      Reference = "󰑨 ",
      Snippet = "󰼹 ",
      String = "󰥛 ",
      Struct = "󰭆 ",
      Text = "󰙩 ",
      TypeParameter = "󰗢 ",
      Unit = "󱍓 ",
      Value = "󰆬 ",
      Variable = "󰮯 ",
    },
    devicons = {
      filename = {
        [".eslintrc.js"] = {
          icon = "󰱺",
          color = "#4b32c3",
          cterm_color = "56",
          name = "EslintrcJs",
        },
        [".eslintrc.json"] = {
          icon = "󰱺",
          color = "#4b32c3",
          cterm_color = "56",
          name = "EslintrcJson",
        },
        [".eslintrc.cjs"] = {
          icon = "󰱺",
          color = "#4b32c3",
          cterm_color = "56",
          name = "EslintrcCjs",
        },
        [".eslintrc.yaml"] = {
          icon = "󰱺",
          color = "#4b32c3",
          cterm_color = "56",
          name = "EslintrcYaml",
        },
        [".eslintrc.yml"] = {
          icon = "󰱺",
          color = "#4b32c3",
          cterm_color = "56",
          name = "EslintrcYml",
        },
        [".gitignore"] = {
          icon = "󰊢",
          color = "#41535b",
          cterm_color = "239",
          name = "GitIgnore",
        },
        [".nvmrc"] = {
          icon = "󰋙",
          color = "#68a063",
          cterm_color = "28",
          name = "Nvmrc",
        },
        ["package.json"] = {
          icon = "󰋘",
          color = "#e8274b",
          name = "PackageJson",
        },
        ["tailwind.config.js"] = {
          icon = "󱏿",
          color = "#38bdf8",
          name = "TailwindConfigJs",
        },
        ["webpack"] = {
          icon = "󰜫",
          color = "#3178c6",
          cterm_color = "74",
          name = "Webpack",
        },
      },
      extension = {
        ["cjs"] = {
          icon = "󰌞",
          color = "#f0db4f",
          cterm_color = "185",
          name = "Cjs",
        },
        ["mjs"] = {
          icon = "󰌞",
          color = "#f0db4f",
          cterm_color = "185",
          name = "Mjs",
        },
        ["js"] = {
          icon = "󰌞",
          color = "#f0db4f",
          cterm_color = "185",
          name = "Js",
        },
        ["test.js"] = {
          icon = "󰳪",
          color = "#f0db4f",
          cterm_color = "185",
          name = "TestJs",
        },
        ["spec.js"] = {
          icon = "󰳪",
          color = "#f0db4f",
          cterm_color = "185",
          name = "SpecJs",
        },
        ["test.jsx"] = {
          icon = "󰳪",
          color = "#61dbfb",
          cterm_color = "45",
          name = "JavaScriptReactTest",
        },
        ["spec.jsx"] = {
          icon = "󰳪",
          color = "#61dbfb",
          cterm_color = "45",
          name = "JavaScriptReactSpec",
        },
        ["log"] = {
          icon = "󰯂",
          color = "#ffffff",
          cterm_color = "231",
          name = "Log",
        },
        ["md"] = {
          icon = "",
          color = "#ffffff",
          cterm_color = "231",
          name = "Md",
        },
        ["mdx"] = {
          icon = "",
          color = "#fcb32c",
          cterm_color = "74",
          name = "Mdx",
        },
        ["pdf"] = {
          icon = "󰈦",
          color = "#b30b00",
          cterm_color = "124",
          name = "Pdf",
        },
        ["prisma"] = {
          icon = "",
          color = "#ffffff",
          cterm_color = "231",
          name = "Prisma",
        },
        ["sol"] = {
          icon = "󱓻",
          color = "#65afff",
          cterm_color = "74",
          name = "Solidity",
        },
        ["svg"] = {
          icon = "󰜡",
          color = "#FFB13B",
          cterm_color = "214",
          name = "Svg",
        },
        ["ts"] = {
          icon = "󰛦",
          color = "#3178c6",
          cterm_color = "74",
          name = "Ts",
        },
        ["test.ts"] = {
          icon = "󰳪",
          color = "#3178c6",
          cterm_color = "74",
          name = "TestTs",
        },
        ["spec.ts"] = {
          icon = "󰳪",
          color = "#3178c6",
          cterm_color = "74",
          name = "SpecTs",
        },
        ["test.tsx"] = {
          icon = "󰳪",
          color = "#1354bf",
          cterm_color = "26",
          name = "TypeScriptReactTest",
        },
        ["spec.tsx"] = {
          icon = "󰳪",
          color = "#1354bf",
          cterm_color = "26",
          name = "TypeScriptReactSpec",
        },
        ["txt"] = {
          icon = "󰎞",
          color = "#89e051",
          cterm_color = "113",
          name = "Txt",
        },
        ["xml"] = {
          icon = "󰗀",
          color = "#e37933",
          cterm_color = "166",
          name = "Xml",
        },
        ["yaml"] = {
          icon = "󰒓",
          color = "#6d8086",
          cterm_color = "66",
          name = "Yaml",
        },
        ["yml"] = {
          icon = "󰒓",
          color = "#6d8086",
          cterm_color = "66",
          name = "Yml",
        },
      },
    },
  },
}

M.renames = {
  ["windwp/nvim-spectre"] = "nvim-pack/nvim-spectre",
}

---@type LazyVimConfig
local options

---@param opts? LazyVimConfig
function M.setup(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {})
  if not M.has() then
    require("lazy.core.util").error(
      "**LazyVim** needs **lazy.nvim** version "
        .. M.lazy_version
        .. " to work properly.\n"
        .. "Please upgrade **lazy.nvim**",
      { title = "LazyVim" }
    )
    error "Exiting"
  end

  if vim.fn.argc(-1) == 0 then
    -- autocmds and keymaps can wait to load
    vim.api.nvim_create_autocmd("User", {
      group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
      pattern = "VeryLazy",
      callback = function()
        M.load "autocmds"
        M.load "keymaps"
      end,
    })
  else
    -- load them now so they affect the opened buffers
    M.load "autocmds"
    M.load "keymaps"
  end

  require("lazy.core.util").try(function()
    if type(M.colorscheme) == "function" then
      M.colorscheme()
    else
      vim.cmd.colorscheme(M.colorscheme)
    end
  end, {
    msg = "Could not load your colorscheme",
    on_error = function(msg)
      require("lazy.core.util").error(msg)
      vim.cmd.colorscheme "habamax"
    end,
  })
end

---@param range? string
function M.has(range)
  local Semver = require "lazy.manage.semver"
  return Semver.range(range or M.lazy_version):matches(require("lazy.core.config").version or "0.0.0")
end

---@param name "autocmds" | "options" | "keymaps"
function M.load(name)
  local Util = require "lazy.core.util"
  local function _load(mod)
    Util.try(function()
      require(mod)
    end, {
      msg = "Failed loading " .. mod,
      on_error = function(msg)
        local info = require("lazy.core.cache").find(mod)
        if info == nil or (type(info) == "table" and #info == 0) then
          return
        end
        Util.error(msg)
      end,
    })
  end
  -- always load lazyvim, then user file
  if M.defaults[name] or name == "options" then
    _load("config." .. name)
  end
  _load("config." .. name)
  if vim.bo.filetype == "lazy" then
    -- HACK: LazyVim may have overwritten options of the Lazy ui, so reset this here
    vim.cmd [[do VimResized]]
  end
  local pattern = "LazyVim" .. name:sub(1, 1):upper() .. name:sub(2)
  vim.api.nvim_exec_autocmds("User", { pattern = pattern, modeline = false })
end

M.did_init = false
function M.init()
  if not M.did_init then
    M.did_init = true
    -- delay notifications till vim.notify was replaced or after 500ms
    require("util").lazy_notify()

    -- load options here, before lazy init while sourcing plugin modules
    -- this is needed to make sure options will be correctly applied
    -- after installing missing plugins
    require("config").load "options"
    local Plugin = require "lazy.core.plugin"
    local add = Plugin.Spec.add
    Plugin.Spec.add = function(self, plugin, ...)
      if type(plugin) == "table" and M.renames[plugin[1]] then
        plugin[1] = M.renames[plugin[1]]
      end
      return add(self, plugin, ...)
    end
  end
end

setmetatable(M, {
  __index = function(_, key)
    if options == nil then
      return vim.deepcopy(defaults)[key]
    end
    ---@cast options LazyVimConfig
    return options[key]
  end,
})

return M
