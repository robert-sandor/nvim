return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		require("mason").setup({})

		local servers = {
			lua_ls = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					runtime = { version = "LuaJIT" },
					telemetry = { enable = false },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
			gopls = {},
			-- rust_analyzer = {},
			ansiblels = {},
			bashls = {},
			cssls = {},
			dockerls = {},
			docker_compose_language_service = {},
			eslint = {},
			html = {},
			tsserver = {},
			pyright = {},
			svelte = {},
			yamlls = {},
		}

		local mason_lspconfig = require("mason-lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local on_attach = function(_, buffer)
			vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.MiniCompletion.completefunc_lsp")

			vim.api.nvim_buf_create_user_command(buffer, "Format", function()
				vim.lsp.buf.format({
					async = true,
					bufnr = buffer,
					filter = function(formatter)
						return formatter.name == "null-ls"
					end,
				})
			end, { desc = "Format current buffer with LSP" })

			vim.api.nvim_buf_create_user_command(buffer, "FormatSync", function()
				vim.lsp.buf.format({
					async = false,
					bufnr = buffer,
					filter = function(formatter)
						return formatter.name == "null-ls"
					end,
				})
			end, { desc = "Format current buffer with LSP" })
		end

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
				})
			end,
		})

		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

		local augroup = vim.api.nvim_create_augroup("UserLspConfig", {})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = augroup,
			callback = function(event)
				local function map(lhs, rhs, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, lhs, rhs, {
						buffer = event.buf,
						desc = desc,
					})
				end

				map("gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")

				local telescope = require("telescope.builtin")
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
	end,
}
