local minideps = require('mini.deps')
local add, now, later = minideps.add, minideps.now, minideps.later
local now_if_args = _G.Config.now_if_args

-- theme
now(function()
  add({ source = 'catppuccin/nvim', name = 'catppuccin' })

  require('catppuccin').setup({ integrations = { treesitter = true } })

  vim.cmd('colorscheme catppuccin-mocha')
end)

-- treesitter
now_if_args(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'main',
    hooks = {
      post_checkout = function()
        vim.cmd('TSUpdate')
      end,
    },
  })

  add({
    source = 'nvim-treesitter/nvim-treesitter-textobjects',
    checkout = 'main',
  })

  local nvim_treesitter = require('nvim-treesitter')

  nvim_treesitter.install({
    'bash',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'lua',
    'markdown',
    'markdown_inline',
    'regex',
    'vimdoc',
    'yaml',
    'json',
  })

  local ts_start = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if lang ~= nil and vim.tbl_contains(nvim_treesitter.get_installed('parsers'), lang) then
      vim.treesitter.start(ev.buf)
    end
  end

  _G.Config.new_autocmd('FileType', nil, ts_start, 'Start tree-sitter')
end)

-- lsp
now_if_args(function()
  add('neovim/nvim-lspconfig')
  vim.lsp.enable({
    'ansiblels',
    'docker_compose_language_service',
    'lua_ls',
  })
end)

-- formatting
later(function()
  add('stevearc/conform.nvim')

  require('conform').setup({
    format_on_save = { timeout_ms = 500 },
    formatters_by_ft = {
      lua = { 'stylua' },
      sh = { 'shfmt' },
      yaml = { 'prettierd' },
    },
  })
end)

-- snippets
later(function()
  add('rafamadriz/friendly-snippets')
end)

-- language specific
later(function()
  add({ source = 'MeanderingProgrammer/render-markdown.nvim', depends = { 'nvim-treesitter/nvim-treesitter' } })
  require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
  })
end)
