require('options')
require('keymap')
require('autocmds')

require('plugins.minideps') -- plugin manager

local now = require('mini.deps').now

now(require('plugins.catppuccin')) -- catppuccin - theme
now(require('plugins.mini')) -- mini.nvim - bunch of plugins that have very little to no custom configuration
now(require('plugins.miniclue')) -- mini.clue - show keymap clues
now(require('plugins.minifiles')) -- mini.files - file manager
now(require('plugins.ministarter')) -- mini.starter - start page
now(require('plugins.fzflua')) -- fzf-lua - picker for all kinds of things
now(require('plugins.navigator')) -- navigator - navigate seamlessly between nvim and tmux
now(require('plugins.gitsigns')) -- gitsigns - show git status and handle hunks
now(require('plugins.treesitter')) -- treesitter - better syntax highlighting
now(require('plugins.blink')) -- blink - code completion engine
now(require('plugins.conform')) -- conform - formatters to use for each file
now(require('plugins.lsp')) -- lsp config
now(require('plugins.lint')) -- nvim-lint - linter for files with no lsp
now(require('plugins.mason')) -- mason - install lsp, linters, formatters

now(require('lang.lua'))
now(require('lang.ansible'))
now(require('lang.docker'))
