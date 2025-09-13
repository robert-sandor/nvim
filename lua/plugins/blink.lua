return function()
  require('mini.deps').add({
    source = 'saghen/blink.cmp',
    depends = { 'rafamadriz/friendly-snippets' },
    checkout = 'v1.6.0',
  })

  require('blink.cmp').setup({})
end
