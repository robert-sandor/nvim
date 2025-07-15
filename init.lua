local utils = require('utils')
local cmd, key = utils.cmd, utils.key

require('options')
require('keymap')
require('autocmds')

--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim',
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
local minideps = require('mini.deps')
minideps.setup({ path = { package = path_package } })

local add, now, later = minideps.add, minideps.now, minideps.later

now(require('plugins.catppuccin')) -- catppuccin - theme
now(require('plugins.mini'))       -- mini.nvim - bunch of plugins that have very little to no custom configuration
now(require('plugins.miniclue'))   -- mini.clue - show keymap clues
now(require('plugins.minifiles'))  -- mini.files - file manager
now(require('plugins.fzflua'))     -- Fzf-lua - Picker for all kinds of things
now(require('plugins.navigator'))  -- Navigator - navigate seamlessly between nvim and tmux
now(require('plugins.gitsigns'))   -- Gitsigns - show git status and handle hunks

-- Treesitter
now(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main',
    hooks = {
      post_checkout = function()
        vim.cmd('TSUpdate')
      end,
    },
  })

  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vimdoc', 'yaml', 'regex' },
    highlight = { enable = true },
    indent = { enable = true },
  })
end)

-- blink - code completion engine
now(function()
  add({
    source = 'saghen/blink.cmp',
    depends = { 'rafamadriz/friendly-snippets' },
    checkout = 'v1.4.1',
  })

  require('blink.cmp').setup({
    keymap = { preset = 'enter' },
  })
end)

-- Conform
now(function()
  add('stevearc/conform.nvim')

  require('conform').setup({
    default_format_opts = { lsp_format = 'fallback', timeout_ms = 500 },
    formatters_by_ft = {
      fish = { 'fish_indent' },
      sh = { 'shfmt' },
    },
    format_on_save = { timeout_ms = 500 },
  })

  key('n', '<leader>cf', require('conform').format, 'code format')
end)

-- LSP config
now(function()
  add('neovim/nvim-lspconfig')

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      -- if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
      -- end
      -- Auto-format ("lint") on save.
      -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
      if
          not client:supports_method('textDocument/willSaveWaitUntil')
          and client:supports_method('textDocument/formatting')
      then
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = vim.api.nvim_create_augroup('UserLspConfig', { clear = false }),
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
          end,
        })
      end
    end,
  })
end)

now(function()
  add('mfussenegger/nvim-lint')

  require('lint').linters_by_ft = {
    fish = { 'fish' },
  }

  vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
    callback = function()
      require('lint').try_lint()
    end,
  })

  key('n', '<leader>cl', require('lint').try_lint, 'code lint')
end)

now(function()
  add('mason-org/mason.nvim')
  add('mason-org/mason-lspconfig.nvim')
  require('mason').setup()
  require('mason-lspconfig').setup()
end)

now(require('lang.lua'))
now(require('lang.ansible'))
now(require('lang.docker'))
