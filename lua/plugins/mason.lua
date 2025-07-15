return function()
  require('mini.deps').add({
    source = 'mason-org/mason-lspconfig.nvim',
    depends = { 'mason-org/mason.nvim' },
  })

  require('mason').setup()
  require('mason-lspconfig').setup()
end
