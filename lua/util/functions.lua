local M = {}

M.clear_search_and_dismiss_notifications = function()
  vim.cmd("noh")
  local have_notify, notify = pcall(require, "notify")
  if have_notify then
    notify.dismiss({ silent = true, pending = true })
  end
end

return M
