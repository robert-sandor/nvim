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
    },
  },
}
