return {
  -- Measure startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- Session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
      -- stylua: ignore
      keys = {
        { "<leader>qs", function() require("persistence").load() end, desc = "Restore session" },
        { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
        { "<leader>qd", function() require("persistence").stop() end, desc = "Don't save current session" },
      },
  },

  -- Library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- Highlight patterns
  require("plugins.extras.util.mini-hipatterns"),
}
