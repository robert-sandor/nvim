return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

		local augroup = vim.api.nvim_create_augroup("UserLspConfig", {})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = augroup,
			callback = function(event)
				vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local function map(lhs, rhs, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, lhs, rhs, {
						buffer = event.buf,
						desc = desc,
					})
				end

				map("gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")

				local telescope = require('telescope.builtin')
				map("gd", telescope.lsp_definitions, "[G]o to [D]efinition")
				map("gr", telescope.lsp_references, "[G]o to [R]eferences")
				map("gi", telescope.lsp_implementations, "[G]o to [I]mplementation")
				map("gt", telescope.lsp_type_definitions, "[G]o to [T]ype Definition")

				map("<leader>fs", telescope.lsp_workspace_symbols, "[F]ind [S]ymbols")

				map("K", vim.lsp.buf.hover, "[K] Show docs")

				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "v" })
				map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
				map("<leader>cl", vim.lsp.codelens.refresh, "[C]ode[L]ens Refresh")
				map("<leader>cf", function()
					vim.lsp.buf.format({ async = true })
				end, "[C]ode [F]ormat")
			end,
		})
	end
}
