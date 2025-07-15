return function()
  require('mini.ai').setup()
  require('mini.icons').setup()
  require('mini.indentscope').setup()
  require('mini.pairs').setup()
  require('mini.starter').setup()
  require('mini.statusline').setup()
  require('mini.surround').setup()

  local notify = require('mini.notify')
  notify.setup()
  vim.notify = notify.make_notify()
end
