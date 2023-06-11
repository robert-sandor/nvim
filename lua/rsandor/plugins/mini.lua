return {
	{ "echasnovski/mini.ai",          config = true },
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
		config = function(_, opts)
			require("mini.bufremove").setup(opts)
			vim.keymap.set("n", "<leader>bd", require("mini.bufremove").delete, { desc = "[B]uffer [D]elete" })
		end,
	},
	{ "echasnovski/mini.comment",     config = true },
	{ "echasnovski/mini.indentscope", config = true },
	{ "echasnovski/mini.move",        config = true },
	{ "echasnovski/mini.pairs",       config = true },
	{ "echasnovski/mini.splitjoin",   config = true },
	{ "echasnovski/mini.starter",     config = true },
	{ "echasnovski/mini.surround",    config = true },
}
