return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
			},
			{
				"williamboman/mason.nvim",
			}
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"gopls",
				"rust_analyzer",
				"ansiblels",
				"bashls",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"eslint",
				"html",
				"tsserver",
				"pyright",
				"svelte",
				"yamlls",
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function() end,
				["rust_analyzer"] = function() end
			})
		end,
	},
}
