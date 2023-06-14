return {
	"folke/which-key.nvim",
	opts = {
		defaults = {
			mode = { "n", "v" },
			["]"] = { name = "+next" },
			["["] = { name = "+prev" },
			["<leader>c"] = { name = "+code" },
			["<leader>d"] = { name = "+debug" },
			["<leader>ds"] = { name = "+step" },
			["<leader>du"] = { name = "+ui" },
			["<leader>f"] = { name = "+find" },
			["<leader>g"] = { name = "+git" },
			["<leader>r"] = { name = "+rust" },
			["<leader>rc"] = { name = "+crates" },
			["<leader>x"] = { name = "+trouble" },
			["<leader>s"] = { name = "+surround" },
		},
	},
	config = function(_, opts)
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
