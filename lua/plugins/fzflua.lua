return function()
  require('mini.deps').add('ibhagwan/fzf-lua')

  local fzf = require('fzf-lua')

  fzf.setup({
    files = {
      cwd_prompt = false,
      hidden = true,
      no_ignore = true,
    },
    grep = {
      hidden = true,
      no_ignore = true,
    },
  })

  fzf.register_ui_select()

  local key = require('utils').key
  key('n', '<leader><space>', fzf.files, 'Find files')
  key('n', '<leader>,', fzf.buffers, 'Find buffers')
  key('n', '<leader>/', fzf.live_grep, 'Grep')
  key('n', '<leader>ff', fzf.files, 'Find files')
  key('n', '<leader>fb', fzf.buffers, 'Find buffers')
  key('n', '<leader>fs', fzf.treesitter, 'Find symbols')
  key('n', '<leader>fR', fzf.resume, 'Resume last find')
  key('n', '<leader>fh', fzf.helptags, 'Find help tags')
end
