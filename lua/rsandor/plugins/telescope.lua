return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		opts = {
			defaults = {
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				["file_browser"] = {
					hijack_netrw = true,
				},
				["fzf"] = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			telescope.load_extension("file_browser")
			telescope.setup(opts)
		end,
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "find files" },
			{ "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", desc = "find all files" },
			{ "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "find text" },
			{ "<leader>fo", "<cmd>Telescope buffers<CR>", desc = "find buffers" },
			{ "<leader>fb", "<cmd>Telescope file_browser<CR>", desc = "file browser" },
			{ "<leader>gf", "<cmd>Telescope git_files<CR>", desc = "git files" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "git status" },
			{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "git branches" },
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "git commits" },
		},
	},
}
