vim.api.nvim_create_user_command(
  "ClearSearchAndDismissNotifications",
  ":lua require('util.functions').clear_search_and_dismiss_notifications()<cr>",
  {}
)
