return {
  { "echasnovski/mini.ai", opts = {} },
  {
    "echasnovski/mini.basics",
    opts = {
      options = {
        win_borders = "bold",
      },
      mappings = {
        move_with_alt = true,
      },
    },
  },
  { "echasnovski/mini.bufremove", opts = {}, keys = require("rsandor.keymap").mini_bufremove },
  { "echasnovski/mini.comment", opts = {}, keys = require("rsandor.keymap").mini_comment },
  { "echasnovski/mini.move", opts = {}, keys = require("rsandor.keymap").mini_move },
  { "echasnovski/mini.pairs", opts = {} },
  { "echasnovski/mini.splitjoin", opts = {}, keys = require("rsandor.keymap").mini_splitjoin },
  {
    "echasnovski/mini.starter",
    opts = function()
      local starter = require("mini.starter")
      return {
        items = {
          starter.sections.recent_files(10, true, false),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet("- "),
          starter.gen_hook.aligning("center", "center"),
        },
      }
    end,
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "<leader>sa",
        delete = "<leader>sd",
        find = "<leader>sf",
        find_left = "<leader>sF",
        highlight = "<leader>sh",
        replace = "<leader>sr",
        update_n_lines = "<leader>sn",
      },
      n_lines = 100,
    },
    keys = require("rsandor.keymap").mini_surround,
  },
}
