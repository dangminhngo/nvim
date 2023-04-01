local util = require("util")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = util.merge_list(
  require("plugins.util"),
  require("plugins.editor"),
  require("plugins.ui"),
  require("plugins.colorscheme"),
  require("plugins.treesitter")
)

require("lazy").setup(plugins)
