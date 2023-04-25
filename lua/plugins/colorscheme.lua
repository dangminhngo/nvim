return {
  {
    -- dir = "/home/jaime/repos/proxima.nvim",
    -- dev = true,
    "dangminhngo/proxima.nvim",
    lazy = true,
    init = function()
      vim.cmd([[colorscheme proxima]])
    end,
  },
}
