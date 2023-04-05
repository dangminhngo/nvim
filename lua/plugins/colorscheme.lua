return {
  {
    "dangminhngo/proxima.nvim",
    lazy = true,
    opts = {
      styles = {
        attribute = "italic",
        comment = "italic",
      },
    },
    init = function()
      vim.cmd([[colorscheme proxima]])
    end,
  },
}
