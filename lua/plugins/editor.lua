local util = require("util")

return {
  -- File tree
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>fe",
        function()
          require("oil").toggle_float(require("util").get_root())
        end,
        desc = "File tree (root)",
      },
      {
        "<leader>fE",
        function()
          require("oil").toggle_float(vim.loop.cwd())
        end,
        desc = "File tree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "File tree (root)", remap = true },
      { "<leader>E", "<leader>fE", desc = "File tree (cwd)", remap = true },
    },
  },
  -- Search/Replace in multiple files
  {
    "nvim-pack/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch buffer" },
      { "<leader>/", util.telescope("live_grep"), desc = "Find in files (Grep)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command history" },
      { "<leader><space>", util.telescope("files"), desc = "Find files (root)" },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", util.telescope("files"), desc = "Find files (root)" },
      { "<leader>fF", util.telescope("files", { cwd = false }), desc = "Find files (cwd)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fR", util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
      -- search
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command history" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>sg", util.telescope("live_grep"), desc = "Grep (root)" },
      { "<leader>sG", util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search highlight groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>sw", util.telescope("grep_string"), desc = "Word (root)" },
      { "<leader>sW", util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
      { "<leader>uC", util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
      {
        "<leader>ss",
        util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        util.telescope("lsp_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol (Workspace)",
      },
    },
    opts = {
      defaults = {
        prompt_prefix = "󰬪 ",
        selection_caret = "󰅂 ",
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<a-t>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
            ["<a-i>"] = function()
              util.telescope("find_files", { no_ignore = true })()
            end,
            ["<a-h>"] = function()
              util.telescope("find_files", { hidden = true })()
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<C-f>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-b>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
          },
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },
  -- Whichkey
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+Tabs" },
        ["<leader>b"] = { name = "+Buffer" },
        ["<leader>c"] = { name = "+Code" },
        ["<leader>f"] = { name = "+File/Find" },
        ["<leader>g"] = { name = "+Git" },
        ["<leader>gh"] = { name = "+Hunks" },
        ["<leader>q"] = { name = "+Quit/Session" },
        ["<leader>s"] = { name = "+Search" },
        ["<leader>u"] = { name = "+UI" },
        ["<leader>w"] = { name = "+Windows" },
        ["<leader>x"] = { name = "+Diagnostics/Quickfix" },
      }

      keymaps["<leader>sn"] = { name = "+Noice" }
      wk.register(keymaps)
    end,
  },
  -- Zen mode
  {
    "folke/zen-mode.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "folke/twilight.nvim" },
    lazy = true,
    keys = {
      { "<leader>uz", util.toggle_zen, desc = "Toggle zen mode" },
    },
  },
  -- Distractions free
  {
    "folke/twilight.nvim",
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
  },
  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "󰦒" },
        delete = { text = "-" },
        topdelete = { text = "󱎘" },
        changedelete = { text = "󰅖" },
        untracked = { text = "󱀧" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next hunk")
        map("n", "[h", gs.prev_hunk, "Prev hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame line")
        map("n", "<leader>ghd", gs.diffthis, "Diff this")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff this ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
      end,
    },
  },
  -- Word references
  {
    "echasnovski/mini.cursorword",
    version = "*",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 200,
    },
    config = function(_, opts)
      require("mini.cursorword").setup(opts)
    end,
  },
  -- Buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete buffer (force)" },
      { "<leader>bw", function() require("mini.bufremove").wipeout(0, false) end, desc = "Wipeout buffer" },
      { "<leader>bW", function() require("mini.bufremove").wipeout(0, true) end, desc = "Wipeout buffer (force)" },
      { "<leader>bu", function() require("mini.bufremove").unshow() end, desc = "Hide buffer all windows" },
      { "<leader>bU", function() require("mini.bufremove").unshow_in_window() end, desc = "Hide buffer this window" },
    },
  },
  -- Better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document diagnostics (trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace diagnostics (trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location list (trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix list (trouble)" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            vim.cmd.cprev()
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.cmd.cnext()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },
  -- Todo comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  },
}
