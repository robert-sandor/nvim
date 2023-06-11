return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				integrations = {
					mini = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
