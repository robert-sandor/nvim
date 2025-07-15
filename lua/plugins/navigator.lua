local key, cmd = require('utils').key, require('utils').cmd

return function()
  require('mini.deps').add('numToStr/Navigator.nvim')

  require('Navigator').setup()

  key({ 'n', 't' }, '<C-h>', cmd('NavigatorLeft'))
  key({ 'n', 't' }, '<C-l>', cmd('NavigatorRight'))
  key({ 'n', 't' }, '<C-k>', cmd('NavigatorUp'))
  key({ 'n', 't' }, '<C-j>', cmd('NavigatorDown'))
end
