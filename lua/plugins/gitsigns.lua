return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signcolumn = true,
      numhl = true,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { desc = desc, buffer = bufnr })
        end

        map("n", "]h", gs.next_hunk, "next hunk")
        map("n", "[h", gs.next_hunk, "previous hunk")
        map({ "n", "v" }, "<leader>ghs", gs.stage_hunk, "[g]it [h]unk [s]tage")
        map({ "n", "v" }, "<leader>ghs", gs.stage_hunk, "[g]it [h]unk [s]tage")
      end,
    },
  },
}
