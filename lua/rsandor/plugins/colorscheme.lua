return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				integrations = {
					cmp = true,
					dap = {
						enabled = true,
						enale_ui = true,
					},
					gitsigns = true,
					lsp_trouble = true,
					mason = true,
					mini = true,
					native_lsp = {
						enabled = true,
					},
					noice = true,
					notify = true,
					telescope = true,
					treesitter = true,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-frappe")
		end,
	},
}
