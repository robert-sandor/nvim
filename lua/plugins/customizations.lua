return {
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin-mocha" } },

  -- disable plugins
  { "akinsho/bufferline.nvim", enabled = false },

  -- formatting config
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        rebar3 = { command = "rebar3", args = { "fmt", "-" } },
      },
      formatters_by_ft = {
        erlang = { "rebar3" },
      },
    },
  },
}
