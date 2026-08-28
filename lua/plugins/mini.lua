-- Icons
require('mini.icons').setup()

-- Statusline
local statusline = require('mini.statusline')
statusline.setup({})
statusline.section_location = function() return '%2l:%-2v' end

-- Additional textobjects
require('mini.ai').setup()

-- Surround
require('mini.surround').setup()

-- Easily move selection up/down
require('mini.move').setup()

-- Picker
require('mini.pick').setup()

vim.keymap.set('n', '<leader>f', '<cmd>Pick files<CR>', { desc = 'Open [F]ile picker' })
vim.keymap.set('n', '<leader>b', '<cmd>Pick buffers<CR>', { desc = 'Open [B]uffer picker' })
vim.keymap.set('n', '<leader>/', '<cmd>Pick grep_live<CR>', { desc = '[/] Global search in workspace' })

-- File manager
require('mini.files').setup({
  windows = {
    max_number = 3,
    preview = true,
    width_preview = 50,
  },
})

local function toggle_minifiles()
  local minifiles = require('mini.files')
  if minifiles.close() == nil then minifiles.open(vim.api.nvim_buf_get_name(0), false) end
end

vim.keymap.set('n', '<leader>e', toggle_minifiles, { desc = '[E]xplore files' })

-- Clues
local miniclue = require('mini.clue')
miniclue.setup({
  window = {
    delay = 100,
    config = { width = 'auto' },
  },
  -- This just uses the recommended defaults so far
  triggers = {
    -- Leader triggers
    { mode = { 'n', 'x' }, keys = '<Leader>' },
    -- `[` and `]` keys
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },
    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },
    -- `g` key
    { mode = { 'n', 'x' }, keys = 'g' },
    -- Marks
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },
    -- Registers
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },
    -- Window commands
    { mode = 'n', keys = '<C-w>' },
    -- `z` key
    { mode = { 'n', 'x' }, keys = 'z' },
  },
  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})
