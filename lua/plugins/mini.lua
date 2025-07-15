return function()
  require('mini.ai').setup({ n_lines = 100 })
  require('mini.icons').setup()
  require('mini.indentscope').setup({ symbol = '▏', options = { try_as_border = true } })
  require('mini.pairs').setup()
  require('mini.statusline').setup()
  require('mini.surround').setup()

  local notify = require('mini.notify')
  notify.setup()
  vim.notify = notify.make_notify()
end
