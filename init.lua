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

now(function()
  add({ source = 'catppuccin/nvim', name = 'catppuccin' })
  vim.cmd('colorscheme catppuccin-mocha')
end)

now(function()
  require('mini.ai').setup()
  require('mini.pairs').setup()
  require('mini.surround').setup()
  require('mini.icons').setup()
  require('mini.indentscope').setup()
  require('mini.statusline').setup()
end)

now(function()
  local notify = require('mini.notify')
  notify.setup()
  vim.notify = notify.make_notify()
end)

-- mini.clue - show keymap clues
now(function()
  local clue = require('mini.clue')
  clue.setup({
    triggers = {
      -- Leader triggers
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      -- Built-in completion
      { mode = 'i', keys = '<C-x>' },

      -- `g` key
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },

      -- Marks
      { mode = 'n', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },

      -- Registers
      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },

      -- Window commands
      { mode = 'n', keys = '<C-w>' },

      -- `z` key
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },
    },
    clues = {
      clue.gen_clues.builtin_completion(),
      clue.gen_clues.g(),
      clue.gen_clues.marks(),
      clue.gen_clues.registers(),
      clue.gen_clues.windows(),
      clue.gen_clues.z(),
      { mode = 'n', keys = '<leader>f', desc = '+find' },
    },
    window = { delay = 200, config = { width = 'auto' } },
  })
end)

-- mini.files - file manager
now(function()
  local files = require('mini.files')
  files.setup({
    mappings = {
      close = '<esc>',
      go_in = '',
      go_in_plus = 'l',
      go_out = '',
      go_out_plus = 'h',
    },
    windows = {
      preview = true,
      max_number = 3,
      width_focus = 50,
      width_nofocus = 15,
      width_preview = 50,
    },
  })

  key('n', '<leader>e', function()
    files.open(vim.api.nvim_buf_get_name(0), false)
  end, 'Open file manager')
end)

-- fzf
now(function()
  add('ibhagwan/fzf-lua')

  local fzf = require('fzf-lua')

  fzf.setup({ files = { no_ignore = true } })

  fzf.register_ui_select()

  key('n', '<leader><space>', fzf.files, 'Find files')
  key('n', '<leader>,', fzf.buffers, 'Find buffers')
  key('n', '<leader>/', fzf.grep, 'Grep')
  key('n', '<leader>ff', fzf.files, 'Find files')
  key('n', '<leader>fb', fzf.buffers, 'Find buffers')
  key('n', '<leader>fs', fzf.treesitter, 'Find symbols')
  key('n', '<leader>fr', fzf.resume, 'Resume last find')
  key('n', '<leader>fh', fzf.helptags, 'Find help tags')
end)

-- Navigator - navigate seamlessly between nvim and tmux
now(function()
  add('numToStr/Navigator.nvim')

  require('Navigator').setup()

  key({ 'n', 't' }, '<C-h>', cmd('NavigatorLeft'))
  key({ 'n', 't' }, '<C-l>', cmd('NavigatorRight'))
  key({ 'n', 't' }, '<C-k>', cmd('NavigatorUp'))
  key({ 'n', 't' }, '<C-j>', cmd('NavigatorDown'))
end)

-- Gitsigns
now(function()
  add('lewis6991/gitsigns.nvim')

  local on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local bufkey = require('utils').buffer_keymap_function(bufnr)

    bufkey('n', '<leader>gp', gitsigns.preview_hunk_inline, 'Git preview hunk')
    bufkey('n', '<leader>gb', gitsigns.blame, 'Git blame')

    bufkey('n', '<leader>gs', gitsigns.stage_hunk, 'Git stage hunk')
    bufkey('n', '<leader>gr', gitsigns.reset_hunk, 'Git reset hunk')
    bufkey('n', '<leader>gS', gitsigns.stage_buffer, 'Git stage buffer')
    bufkey('n', '<leader>gR', gitsigns.reset_buffer, 'Git reset buffer')

    bufkey('v', '<leader>gs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Git stage hunk')
    bufkey('v', '<leader>gr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Git reset hunk')

    bufkey('n', '<leader>gtb', gitsigns.toggle_current_line_blame, 'Git toggle blame')
    bufkey('n', '<leader>gtb', gitsigns.toggle_word_diff, 'Git toggle word diff')

    bufkey({ 'o', 'x' }, 'ih', gitsigns.select_hunk, 'In hunk')

    table.insert(require('mini.clue').config.clues, { mode = 'n', keys = '<leader>g', desc = '+git' })
  end

  require('gitsigns').setup({
    signcolumn = true,
    numhl = true,
    on_attach = on_attach,
  })
end)

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
  require('mason').setup()
end)

now(require('lang.lua'))
now(require('lang.ansible'))
now(require('lang.docker'))
