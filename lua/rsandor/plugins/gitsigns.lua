return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signcolumn = true,
		numhl = true,
		on_attach = function(bufnr)
			local gs = require("gitsigns")
			vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Go to Previous [H]unk" })
			vim.keymap.set("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Go to Next [H]unk" })
		end
	},
}
