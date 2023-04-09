return {
  {
    -- dir = "/home/jaime/repos/proxima.nvim",
    -- dev = true,
    "dangminhngo/proxima.nvim",
    lazy = true,
    opts = {
      plugins = {
        alpha = true,
        dashboard = true,
        diff = true,
        gitsigns = true,
        lazy = true,
        mini = true,
        neo_tree = true,
        nvim_cmp = true,
        nvim_notify = true,
        nvim_ts_rainbow = true,
        telescope = true,
        trouble = true,
        which_key = true,
      },
    },
    init = function()
      vim.cmd([[colorscheme proxima]])
    end,
  },
}
