return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    opts = function()
      local actions = require("telescope.actions")
      local telescopeConfig = require("telescope.config")

      -- from: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#file-and-text-search-in-hidden-files-and-directories
      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
      -- I want to search in hidden/dot files.
      table.insert(vimgrep_arguments, "--hidden")
      -- I don't want to search in the `.git` directory.
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")

      return {
        defaults = {
          layout_strategy = "vertical",
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
          vimgrep_arguments = vimgrep_arguments,
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--no-ignore-vcs" },
          },
        },
      }
    end,
    cmd = "Telescope",
    keys = {
      { "<leader><leader>", "<cmd>Telescope find_files<cr>",  desc = "find files" },
      { "<leader>ff",       "<cmd>Telescope find_files<cr>",  desc = "[f]ind [f]iles" },
      { "<leader>fg",       "<cmd>Telescope git_files<cr>",   desc = "[f]ind [g]it files" },
      { "<leader>fw",       "<cmd>Telescope grep_string<cr>", desc = "[f]ind [w]ord" },
      { "<leader>fl",       "<cmd>Telescope live_grep<cr>",   desc = "[f]ind [l]ive grep" },
      { "<leader>fc",       "<cmd>Telescope commands<cr>",    desc = "[f]ind [c]ommands" },
      { "<leader>fm",       "<cmd>Telescope man_pages<cr>",   desc = "[f]ind [m]an page" },
      { "<leader>fo",       "<cmd>Telescope vim_options<cr>", desc = "[f]ind [o]ptions" },
      { "<leader>fr",       "<cmd>Telescope registers<cr>",   desc = "[f]ind [r]egisters" },
      { "<leader>fh",       "<cmd>Telescope help_tags<cr>",   desc = "[f]ind [h]elp" },
      { "<leader>fr",       "<cmd>Telescope resume<cr>",      desc = "[f]ind [r]esume" },
      { "<leader>gg",       "<cmd>Telescope git_status<cr>",  desc = "[g]it status" },
    },
  },
}
