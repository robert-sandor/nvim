return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup()

		require("mini.basics").setup({
			options = {
				win_borders = "bold",
			},
			mappings = {
				move_with_alt = true,
			},
		})

		require("mini.bufremove").setup()
		require("mini.comment").setup()
		require("mini.indentscope").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.splitjoin").setup()
		require("mini.statusline").setup()
		require("mini.surround").setup()
	end,
}
