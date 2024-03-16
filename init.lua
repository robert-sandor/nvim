require('rsandor.settings')
require('rsandor.mappings')
require('rsandor.autocommands')

-- bootstrap lazy.nvim for plugin management
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- initialize lazy.nvim
require('lazy').setup('rsandor.plugins', {
  install = { colorscheme = { 'catppuccin-macchiato', 'habamax' } },
  change_detection = { notify = false },
})
