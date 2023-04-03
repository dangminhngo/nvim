return {
  {
    dir = "/home/jaime/repos/proxima.nvim",
    dev = true,
    lazy = true,
    opts = {
      styles = {
        attributes = "italic",
      },
    },
    init = function()
      vim.cmd("colorscheme proxima")
    end,
  },
}
