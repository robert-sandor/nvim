return {
  "echasnovski/mini.clue",
  version = "*",
  event = "VeryLazy",
  opts = function()
    local clue = require("mini.clue")
    return {
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },

        -- mini.bracketed
        { mode = "n", keys = "[" },
        { mode = "x", keys = "[" },
        { mode = "n", keys = "]" },
        { mode = "x", keys = "]" },
      },

      clues = {
        { mode = "n", keys = "<leader>b", desc = "+buffers" },
        { mode = "n", keys = "<leader>f", desc = "+find" },
        { mode = "n", keys = "<leader>g", desc = "+git" },
        -- Enhance this by adding descriptions for <Leader> mapping groups,
        clue.gen_clues.builtin_completion(),
        clue.gen_clues.g(),
        clue.gen_clues.marks(),
        clue.gen_clues.registers(),
        clue.gen_clues.windows(),
        clue.gen_clues.z(),
      },

      window = {
        delay = 500,
        config = {
          width = 50,
        },
      },
    }
  end,
}
