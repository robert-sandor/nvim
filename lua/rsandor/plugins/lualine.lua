return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto",
				section_separators = {
					left = "",
					right = "",
				},
				component_separators = {
					left = "",
					right = "",
				},
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					{
						function()
							return "󰑋 " .. require("noice").api.status.mode.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.mode.has()
						end,
					},
				},
				lualine_c = { "branch", "diff" },
				lualine_x = { "diagnostics", "location" },
				lualine_y = {
					{
						function()
							return " " .. require("dap").status()
						end,
						cond = function()
							return package.loaded["dap"] and require("dap").status() ~= ""
						end,
					},
				},
				lualine_z = { { "filetype", icon_only = true, colored = false }, { "filename", path = 1 } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				lualine_c = {
					{ "buffers", symbols = { modified = " 󰑋 ", alternate_file = "", directory = " 󰉋 " } },
				},
			},
		},
	},
}
