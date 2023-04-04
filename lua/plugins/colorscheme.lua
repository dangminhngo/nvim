return {
  {
    "dangminhngo/proxima.nvim",
    lazy = true,
    opts = {
      styles = {
        attributes = "italic",
        comment = "italic",
      },
    },
    init = function()
      vim.cmd("colorscheme proxima")
    end,
  },
}
