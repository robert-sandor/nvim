local function gh(repo) return 'https://github.com/' .. repo end

-- Needed by chezmoi.vim
vim.g['chezmoi#use_tmp_buffer'] = true

vim.pack.add({
  gh('nvim-lua/plenary.nvim'), -- needed by some other plugins
  { src = gh('catppuccin/nvim'), name = 'catppuccin' },
  gh('nvim-mini/mini.nvim'),
  gh('folke/snacks.nvim'),
  gh('neovim/nvim-lspconfig'),
  gh('stevearc/conform.nvim'),
  { src = gh('saghen/blink.cmp'), version = vim.version.range('1.*') },
  gh('mfussenegger/nvim-lint'),
  { src = gh('nvim-treesitter/nvim-treesitter'), version = 'main' },
  { src = gh('nvim-treesitter/nvim-treesitter-textobjects'), version = 'main' },
  gh('mfussenegger/nvim-ansible'), -- Specific to Ansible
  gh('b0o/SchemaStore.nvim'),
  gh('alker0/chezmoi.vim'),
  gh('xvzc/chezmoi.nvim'),
})

require('plugins.catppuccin')
require('plugins.mini')
require('plugins.snacks')
require('plugins.treesitter')
require('plugins.conform')
require('plugins.lint')
require('plugins.blink')
require('plugins.chezmoi')
