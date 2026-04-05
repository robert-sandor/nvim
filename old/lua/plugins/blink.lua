return function()
  require('mini.deps').add({
    source = 'saghen/blink.cmp',
    depends = { 'rafamadriz/friendly-snippets' },
    checkout = 'v1.6.0',
  })

  require('blink.cmp').setup({
    sources = {
      providers = {
        snippets = {
          should_show_items = function(ctx)
            return ctx.trigger.initial_kind ~= 'trigger_character'
          end,
        },
      },
    },
  })
end
