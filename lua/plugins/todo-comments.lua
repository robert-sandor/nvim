return function()
  require('mini.deps').add({
    source = 'folke/todo-comments.nvim',
    depends = { 'nvim-lua/plenary.nvim' },
  })

  require('todo-comments').setup({
    signs = false,
    keywords = {
      FIX = { alt = { 'fix', 'fixme', 'FIXME' } },
      TODO = { alt = { 'todo' } },
      HACK = { alt = { 'hack' } },
      WARN = { alt = { 'warn', 'warning', 'WARNING' } },
      NOTE = { alt = { 'note', 'info', 'INFO' } },
    },
    highlight = {
      keyword = 'fg',
      after = 'fg',
    },
  })

  local utils = require('utils')
  utils.key('n', '<leader>ft', utils.cmd('TodoQuickFix'), 'find todos')
end
