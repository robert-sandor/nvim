return {
  'stevearc/conform.nvim',
  dependencies = { 'mason.nvim' },
  event = 'BufWritePre',
  cmd = 'ConformInfo',
  opts = {
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      yaml = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },
      sh = { 'shfmt' },
      bash = { 'shfmt' },
      go = { 'goimports-reviser', 'gofumpt' },
      python = { 'ruff' },
      rust = { 'rustfmt' },
    },
    formatters = {
      shfmt = {
        prepend_args = { '-i', '2' },
      },
    },
  },
}
