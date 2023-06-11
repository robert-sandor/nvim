return {
	{ "echasnovski/mini.ai", config = true },
	{
		"echasnovski/mini.basics",
		opts = {
			options = {
				win_borders = "bold",
			},
			mappings = {
				move_with_alt = true,
			},
		},
	},
	{
		"echasnovski/mini.bufremove",
		opts = {},
		keys = {
			{
				"<leader>bd",
				function()
					require("mini.bufremove").delete()
				end,
				desc = "[B]uffer [D]elete",
			},
		},
	},
	{ "echasnovski/mini.comment", config = true },
	{ "echasnovski/mini.indentscope", config = true },
	{ "echasnovski/mini.move", config = true },
	{ "echasnovski/mini.pairs", config = true },
	{ "echasnovski/mini.splitjoin", config = true },
	{ "echasnovski/mini.starter", config = true },
	{
		"echasnovski/mini.surround",
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
	},
}
