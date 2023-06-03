return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		init = function()
			require("catppuccin").setup({
				integrations = {
					mini = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	init = function()
	-- 		vim.cmd.colorscheme("tokyonight-night")
	-- 	end,
	-- },
}
