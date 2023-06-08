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
	config = function(_, opts)
		require("obsidian").setup(opts)

		local function map(lhs, rhs, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, "<leader>o" .. lhs, rhs, { desc = "[O]bsidian " .. desc })
		end

		map("o", "<cmd>ObsidianFollowLink<CR>", "[O]pen Link")
		map("t", "<cmd>ObsidianToday<CR>", "[T]oday")
		map("y", "<cmd>ObsidianYesterday<CR>", "[Y]esterday")
		map("b", "<cmd>ObsidianBacklinks<CR>", "[B]acklinks")
		map("v", "<cmd>ObsidianOpen<CR>", "[V]iew in App")
	end,
}
