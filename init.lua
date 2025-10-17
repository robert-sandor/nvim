-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local mini_path = vim.fn.stdpath('data') .. '/site/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/nvim-mini/mini.nvim',
    mini_path,
  })
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
local deps = require('mini.deps')
deps.setup()

-- Global configurations and helpers
_G.Config = {}

local augroup = vim.api.nvim_create_augroup('custom-config', {})
_G.Config.new_autocmd = function(event, pattern, callback, desc)
  vim.api.nvim_create_autocmd(event, { group = augroup, pattern = pattern, callback = callback, desc = desc })
end

-- Some plugins only and 'mini.nvim' modules need setup during startup if Neovim
-- is started like `nvim -- path/to/file`, otherwise delaying startup is fine
_G.Config.now_if_args = vim.fn.argc(-1) > 0 and deps.now or deps.later
