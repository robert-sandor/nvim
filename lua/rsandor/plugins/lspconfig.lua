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

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(opts.servers),
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						settings = opts.servers[server_name],
					})
				end,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(event)
					require("rsandor.util").load_keymaps(require("rsandor.keymap").lsp, { buffer = event.buf })
				end,
			})
		end,
	},
}
