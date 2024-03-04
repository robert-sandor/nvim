return {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleToggle" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = { use_diagnostic_signs = true },
  keys = require("rsandor.keymap").trouble,
}
