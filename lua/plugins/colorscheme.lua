return {
  {
    "dangminhngo/proxima.nvim",
    lazy = true,
    opts = {
      options = {
        styles = {
          attributes = "italic",
        },
      },
    },
    init = function()
      vim.cmd("colorscheme proxima")
    end,
  },
}
