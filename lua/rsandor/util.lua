return {
  load_keymaps = function(keymaps, opts)
    opts = opts or {}
    for _, keymap in ipairs(keymaps) do
      local mode = keymap.mode or "n"
      opts.desc = keymap.desc or ""
      vim.keymap.set(mode, keymap[1], keymap[2], opts)
    end
  end,
}
