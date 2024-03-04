return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  cond = function()
    return os.getenv("TMUX")
  end,
}
