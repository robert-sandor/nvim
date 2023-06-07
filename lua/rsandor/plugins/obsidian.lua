return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	event = { "BufReadPre " .. vim.fn.expand("~") .. "/obsidian/**.md" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		dir = "~/obsidian",
		completion = {
			nvim_cmp = true,
		},
	},
}
