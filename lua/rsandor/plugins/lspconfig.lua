return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			servers = {
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
			},
		},
		config = function(_, opts)
			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			local on_attach = function(_, buffer)
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

				require("rsandor.util").load_keymaps(require("rsandor.keymap").lsp, { buffer = buffer })
			end

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(opts.servers),
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = opts.servers[server_name],
					})
				end,
			})
		end,
	},
}
