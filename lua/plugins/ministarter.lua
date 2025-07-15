return function()
  local starter = require('mini.starter')
  starter.setup({
    evaluate_single = true,
    items = {
      starter.sections.recent_files(10, true),
      starter.sections.builtin_actions(),
    },
    footer = '',
  })
end
