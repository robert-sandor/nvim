require('settings')
require('mappings')
require('autocommands')

-- bootstrap lazy.nvim for plugin management
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- initialize lazy.nvim
require('lazy').setup('plugins', {
  install = {
    colorscheme = { 'catppuccin-macchiato', 'habamax' },
  },
  change_detection = {
    notify = false,
  },
})
