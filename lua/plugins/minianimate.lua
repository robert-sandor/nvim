return function()
  local animate = require('mini.animate')
  animate.setup({
    cursor = { enable = false },
    resize = { enable = false },
    scroll = {
      enable = true,
      timing = animate.gen_timing.linear({ duration = 150, unit = 'total' }),
      subscroll = animate.gen_subscroll.equal({ max_output_steps = 120 }),
    },
  })
end
