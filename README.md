# Simple and minimal neovim config

Requirements:
  - neovim (of course)
  - ripgrep
  - fd (some package managers have this as fd-find)
  - fzf
  - treesitter
  - python-pip, npm, cargo, go - optionally, for LSP installation

To install this configuration:

```sh
# Remove local states and caches - optional
rm -Irf ~/.local/state/nvim ~/.local/share/nvim ~/.cache/nvim

# Clone the repository
# If you want to use NVIM_APPNAME, clone to a different directory (:h $NVIM_APPNAME for more info)
git clone https://github.com/robert-sandor/nvim.git ~/.config/nvim

# Start neovim - wait for plugins to be installed
nvim
```

## Included plugins

You can see the full list in [init.lua](./init.lua). Notable mentions
- [mini.nvim](https://github.com/nvim-mini/mini.nvim?tab=readme-ov-file) - uses mini.deps as the package manager, as well as a bunch of other modules - this is the backbone of the configuration
- [fzf-lua](https://github.com/ibhagwan/fzf-lua) - uses `fzf` for all neovim pickers
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - integration with treesitter for better syntax highlighting and textobjects
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - visualize git changes in-editor, and stage/unstage hunks
- [blink](https://github.com/Saghen/blink.cmp) - auto completion plugin
- [conform](https://github.com/stevearc/conform.nvim) - formatter plugin
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) - linter plugin (mainly for languages with no LSP)
- [mason](https://github.com/mason-org/mason.nvim) - package manager for LSPs, formatters and linters


## Plugins to be added

This may be a running list of plugins for me to check out, and decide on including by default:
- [emmanueltouzery/decisive.nvim](https://github.com/emmanueltouzery/decisive.nvim?tab=readme-ov-file)
