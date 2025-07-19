return function()
  require('mini.deps').add({
    source = 'folke/todo-comments.nvim',
    depends = { 'nvim-lua/plenary.nvim' },
  })

  require('todo-comments').setup({
    signs = false,
    keywords = {
      FIX = { alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'fix', 'fixme', 'bug', 'fixit', 'issue' } },
      TODO = { alt = { 'todo' } },
      HACK = { alt = { 'hack' } },
      WARN = { alt = { 'WARNING', 'XXX', 'warn', 'warning', 'xxx' } },
      NOTE = { alt = { 'INFO', 'note', 'info' } },
    },
    highlight = {
      before = 'fg',
      keyword = 'fg',
      after = 'fg',
    },
  })

  local utils = require('utils')
  utils.key('n', '<leader>ft', utils.cmd('TodoFzfLua'), 'find todos')
  utils.key('n', ']t', require('todo-comments').jump_next, 'Next todo comment')
  utils.key('n', '[t', require('todo-comments').jump_prev, 'Previous todo comment')
end
