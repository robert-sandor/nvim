return {
	{ "echasnovski/mini.ai",          opts = {} },
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
	{ "echasnovski/mini.bufremove",   opts = {}, keys = require("rsandor.keymap").mini_bufremove },
	{ "echasnovski/mini.comment",     opts = {}, keys = require("rsandor.keymap").mini_comment },
	{ "echasnovski/mini.indentscope", opts = {} },
	{ "echasnovski/mini.move",        opts = {}, keys = require("rsandor.keymap").mini_move },
	{ "echasnovski/mini.pairs",       opts = {} },
	{ "echasnovski/mini.splitjoin",   opts = {}, keys = require("rsandor.keymap").mini_splitjoin },
	{
		"echasnovski/mini.starter",
		opts = function()
			local starter = require("mini.starter")
			return {
				items = {
					starter.sections.telescope(),
				},
				content_hooks = {
					starter.gen_hook.adding_bullet(),
					starter.gen_hook.aligning("center", "center"),
				},
			}
		end,
	},
	{
		"echasnovski/mini.surround",
		opts = {
			mappings = {
				add = "gsa",
				delete = "gsd",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				replace = "gsr",
				update_n_lines = "gsn",
			},
			n_lines = 100,
		},
		keys = require("rsandor.keymap").mini_surround,
	},
}
