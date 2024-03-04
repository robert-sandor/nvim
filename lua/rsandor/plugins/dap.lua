return {
  {
    "mfussenegger/nvim-dap",
    keys = require("rsandor.keymap").dap,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    keys = require("rsandor.keymap").dap_ui,
    opts = {},
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },
}
