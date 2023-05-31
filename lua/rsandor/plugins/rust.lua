return {
	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			local rt = require("rust-tools")
			local mason_registry = require("mason-registry")
			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

			rt.setup({
				dap = {
					adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
				},
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
			})

			local function rust_map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, "<leader>r" .. lhs, rhs, { desc = "[R]ust: " .. desc })
			end

			rust_map("n", "a", "<cmd>RustHoverActions<CR>", "[A]ctions")
			rust_map("n", "r", "<cmd>RustRunnables<CR>", "[R]unnables")
			rust_map("n", "u", "<cmd>RustMoveItemUp<CR>", "Move Item [U]p")
			rust_map("n", "d", "<cmd>RustMoveItemUp<CR>", "Move Item [D]own")
			rust_map("n", "C", "<cmd>RustOpenCargo<CR>", "Open [C]argo.toml")
		end,
	},
	{
		"saecki/crates.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local crates = require('crates')
			crates.setup()

			local function crates_map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, "<leader>rc" .. lhs, rhs, { desc = "[R]ust [C]rates: " .. desc })
			end

			crates_map("n", "t", crates.toggle, "[T]oggle")
			crates_map("n", "r", crates.reload, "[R]eload")

			crates_map("n", "v", crates.show_versions_popup, "[V]ersions popup")
			crates_map("n", "f", crates.show_features_popup, "[F]eatures popup")
			crates_map("n", "d", crates.show_dependencies_popup, "[D]ependencies popup")

			crates_map("n", "u", crates.update_crate, "[U]pdate crate")
			crates_map("v", "u", crates.update_crates, "[U]pdate crate")
			crates_map("n", "a", crates.update_all_crates, "[U]pdate crates")
			crates_map("n", "U", crates.upgrade_crate, "[U]pgrade crate")
			crates_map("v", "U", crates.upgrade_crates, "[U]pgrade crate")
			crates_map("n", "A", crates.upgrade_all_crates, "[U]pgrade crates")

			crates_map("n", "H", crates.open_homepage, "[H]omepage")
			crates_map("n", "R", crates.open_repository, "[R]epository")
			crates_map("n", "D", crates.open_documentation, "[D]ocumentation")
			crates_map("n", "C", crates.open_crates_io, "[C]rates.io")
		end,
	}
}
