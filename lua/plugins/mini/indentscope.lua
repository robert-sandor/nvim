return {
  'echasnovski/mini.indentscope',
  event = 'VeryLazy',
  opts = function()
    return {
      draw = {
        delay = 100,
        animation = require('mini.indentscope').gen_animation.none(),
      },
      options = {
        border = 'top',
      },
    }
  end,
}
