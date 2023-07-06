return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {},
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
		end,
		keys = require("rsandor.keymap").neotree,
	},
}
