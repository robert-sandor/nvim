local minideps = require('mini.deps')
local now, later = minideps.now, minideps.later
local now_if_args = _G.Config.now_if_args

now(function()
  require('mini.basics').setup({
    -- Manage options in 'plugin/10_options.lua' for didactic purposes
    options = { basic = false },
    mappings = {
      -- Create `<C-hjkl>` mappings for window navigation
      windows = true,
      -- Create `<M-hjkl>` mappings for navigation in Insert and Command modes
      move_with_alt = true,
    },
  })
  require('mini.notify').setup()
  require('mini.statusline').setup()
end)

now(function()
  local icons = require('mini.icons')
  later(icons.mock_nvim_web_devicons)
  later(icons.tweak_lsp_kind)
end)

now_if_args(function()
  local misc = require('mini.misc')
  misc.setup_restore_cursor()
  misc.setup_termbg_sync()
end)

later(function()
  require('mini.align').setup()
  require('mini.bufremove').setup()
  require('mini.bracketed').setup()
  require('mini.diff').setup()
  require('mini.extra').setup()
  require('mini.files').setup({ windows = { preview = true } })
  require('mini.git').setup()
  require('mini.indentscope').setup()
  require('mini.jump').setup()
  require('mini.move').setup()
  require('mini.pairs').setup({ modes = { command = true } })
  require('mini.pick').setup()
  require('mini.splitjoin').setup()
  require('mini.surround').setup()
  require('mini.trailspace').setup()
end)

later(function()
  local extra = require('mini.extra')
  local ai = require('mini.ai')
  ai.setup({
    custom_textobjects = {
      -- Make `aB` / `iB` act on around/inside whole *b*uffer
      B = extra.gen_ai_spec.buffer(),
      -- For more complicated textobjects that require structural awareness,
      -- use tree-sitter. This example makes `aF`/`iF` mean around/inside function
      -- definition (not call). See `:h MiniAi.gen_spec.treesitter()` for details.
      F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
    },

    -- 'mini.ai' by default mostly mimics built-in search behavior: first try
    -- to find textobject covering cursor, then try to find to the right.
    -- Although this works in most cases, some are confusing. It is more robust to
    -- always try to search only covering textobject and explicitly ask to search
    -- for next (`an`/`in`) or last (`an`/`il`).
    -- Try this. If you don't like it - delete next line and this comment.
    search_method = 'cover',
  })
end)

later(function()
  local miniclue = require('mini.clue')
  miniclue.setup({
    -- Define which clues to show. By default shows only clues for custom mappings
    -- (uses `desc` field from the mapping; takes precedence over custom clue).
    clues = {
      -- This is defined in 'plugin/20_keymaps.lua' with Leader group descriptions
      Config.leader_group_clues,
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      -- This creates a submode for window resize mappings. Try the following:
      -- - Press `<C-w>s` to make a window split.
      -- - Press `<C-w>+` to increase height. Clue window still shows clues as if
      --   `<C-w>` is pressed again. Keep pressing just `+` to increase height.
      --   Try pressing `-` to decrease height.
      -- - Stop submode either by `<Esc>` or by any key that is not in submode.
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
    },
    -- Explicitly opt-in for set of common keys to trigger clue window
    triggers = {
      { mode = 'n', keys = '<Leader>' }, -- Leader triggers
      { mode = 'x', keys = '<Leader>' },
      { mode = 'n', keys = '\\' }, -- mini.basics
      { mode = 'n', keys = '[' }, -- mini.bracketed
      { mode = 'n', keys = ']' },
      { mode = 'x', keys = '[' },
      { mode = 'x', keys = ']' },
      { mode = 'i', keys = '<C-x>' }, -- Built-in completion
      { mode = 'n', keys = 'g' }, -- `g` key
      { mode = 'x', keys = 'g' },
      { mode = 'n', keys = "'" }, -- Marks
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },
      { mode = 'n', keys = '"' }, -- Registers
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },
      { mode = 'n', keys = '<C-w>' }, -- Window commands
      { mode = 'n', keys = 'z' }, -- `z` key
      { mode = 'x', keys = 'z' },
    },
  })
end)

later(function()
  -- Customize post-processing of LSP responses for a better user experience.
  -- Don't show 'Text' suggestions (usually noisy) and show snippets last.
  local completion = require('mini.completion')

  local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
  local process_items = function(items, base)
    return completion.default_process_items(items, base, process_items_opts)
  end

  completion.setup({
    lsp_completion = {
      source_func = 'omnifunc',
      auto_setup = false,
      process_items = process_items,
    },
  })

  -- Set 'omnifunc' for LSP completion only when needed.
  local on_attach = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
  end
  _G.Config.new_autocmd('LspAttach', nil, on_attach, "Set 'omnifunc'")

  vim.lsp.config('*', { capabilities = completion.get_lsp_capabilities() })
end)

later(function()
  local extra = require('mini.extra')
  local hipatterns = require('mini.hipatterns')
  local hi_words = extra.gen_highlighter.words
  hipatterns.setup({
    highlighters = {
      fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
      hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
      todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
      note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),

      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end)

later(function()
  -- Define language patterns to work better with 'friendly-snippets'
  local latex_patterns = { 'latex/**/*.json', '**/latex.json' }
  local lang_patterns = {
    tex = latex_patterns,
    plaintex = latex_patterns,
    -- Recognize special injected language of markdown tree-sitter parser
    markdown_inline = { 'markdown.json' },
  }

  local snippets = require('mini.snippets')
  local config_path = vim.fn.stdpath('config')
  snippets.setup({
    snippets = {
      -- Always load 'snippets/global.json' from config directory
      snippets.gen_loader.from_file(config_path .. '/snippets/global.json'),
      -- Load from 'snippets/' directory of plugins, like 'friendly-snippets'
      snippets.gen_loader.from_lang({ lang_patterns = lang_patterns }),
    },
  })

  -- By default snippets available at cursor are not shown as candidates in
  -- 'mini.completion' menu. This requires a dedicated in-process LSP server
  -- that will provide them. To have that, uncomment next line (use `gcc`).
  -- MiniSnippets.start_lsp_server()
end)
