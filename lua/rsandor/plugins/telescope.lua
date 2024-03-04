return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
      extensions = {
        ["fzf"] = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,
    keys = require("rsandor.keymap").telescope,
  },
}
