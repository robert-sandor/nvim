return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
      'folke/trouble.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')
      local themes = require('telescope.themes')

      -- from: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#file-and-text-search-in-hidden-files-and-directories
      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(require('telescope.config').values.vimgrep_arguments) }
      -- search hidden files
      table.insert(vimgrep_arguments, '--hidden')
      -- search .gitignored files
      table.insert(vimgrep_arguments, '--no-ignore-vcs')
      -- exclude .git files
      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!**/.git/*')

      telescope.setup({
        defaults = {
          layout_strategy = 'center',
          mappings = {
            i = {
              ['<esc>'] = require('telescope.actions').close,
              ['<c-t>'] = require('trouble.providers.telescope').open_with_trouble,
            },
          },
          vimgrep_arguments = vimgrep_arguments,
        },
        pickers = {
          find_files = {
            find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*', '--no-ignore-vcs' },
          },
        },
        extensions = {
          ['ui-select'] = {
            themes.get_dropdown(),
          },
        },
      })

      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'ui-select')

      local nmap = require('rsandor.utils').nmap

      nmap('<leader><leader>', builtin.buffers, 'find opened buffers')
      nmap('<leader>ff', builtin.find_files, 'find files')
      nmap('<leader>fg', builtin.live_grep, 'find by grep')
      nmap('<leader>fw', builtin.grep_string, 'find current word')
      nmap('<leader>fh', builtin.help_tags, 'find help')
      nmap('<leader>fr', builtin.resume, 'find resume')
      nmap('<leader>fd', builtin.diagnostics, 'find diagnostics')
      nmap('<leader>fo', builtin.oldfiles, 'find oldfiles')
      nmap('<leader>/', builtin.current_buffer_fuzzy_find, '/ fuzzy search in buffer')
    end,
  },
}
