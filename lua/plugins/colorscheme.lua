return {
  {
    -- dir = "~/repos/proxima.nvim",
    -- dev = true,
    "dangminhngo/proxima.nvim",
    lazy = true,
    -- opts = {
    --   style = "midnight",
    -- },
    init = function()
      vim.cmd([[colorscheme proxima]])
    end,
  },
}
