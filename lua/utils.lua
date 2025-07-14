return {
  cmd = function(command)
    return string.format('<cmd>%s<cr>', command)
  end,
  key = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { desc = desc })
  end,
  buffer_keymap_function = function(bufnr)
    return function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = bufnr })
    end
  end,
}
