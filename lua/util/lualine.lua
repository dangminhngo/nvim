local M = {}

M.components = {
  mode = function()
    local map = {
      ["n"] = "󰊠  Normal",
      ["no"] = "󰟪  O-Pending",
      ["nov"] = "󰟪  O-Pending",
      ["noV"] = "󰟪  O-Pending",
      ["no\22"] = "󰟪  O-Pending",
      ["niI"] = "󰊠  Normal",
      ["niR"] = "󰊠  Normal",
      ["niV"] = "󰊠  Normal",
      ["nt"] = "󰊠  Normal",
      ["ntT"] = "󰊠  Normal",
      ["v"] = "󱊹  Visual",
      ["vs"] = "󱊹  Visual",
      ["V"] = "󰆘  V-Line",
      ["Vs"] = "󰆘  V-Line",
      ["\22"] = "󰐉  V-Block",
      ["\22s"] = "󰐉  V-Block",
      ["s"] = "󱇪  Select",
      ["S"] = "󱇪  S-Line",
      ["\19"] = "󱇪  S-Block",
      ["i"] = "󰈸  Insert",
      ["ic"] = "󰈸  Insert",
      ["ix"] = "󰈸  Insert",
      ["R"] = "󰏒  Replace",
      ["Rc"] = "󰏒  Replace",
      ["Rx"] = "󰏒  Replace",
      ["Rv"] = "󰴻  V-Replace",
      ["Rvc"] = "󰴻  V-Replace",
      ["Rvx"] = "󰴻  V-Replace",
      ["c"] = "󰆥  Command",
      ["cv"] = "󰚏  Ex",
      ["ce"] = "󰚏  Ex",
      ["r"] = "󰏒  Replace",
      ["rm"] = "󱜜  More",
      ["r?"] = "󰶞  Confirm",
      ["!"] = "󰨊  Shell",
      ["t"] = "󰚺  Terminal",
    }

    local mode_code = vim.api.nvim_get_mode().mode
    return map[mode_code] or mode_code
  end,
}

return M
