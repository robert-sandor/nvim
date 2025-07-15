return function()
  require('mini.deps').add({
    source = 'saghen/blink.cmp',
    depends = { 'rafamadriz/friendly-snippets' },
    checkout = 'v1.4.1',
  })

  require('blink.cmp').setup({
    keymap = { preset = 'enter' },
  })
end
