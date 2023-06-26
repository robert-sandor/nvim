-- stylua: ignore
local keymaps = {
	base = {
		{ "<esc>",      "<cmd>nohl<CR>",           desc = "remove search highlight" },
		{ "J",          "mzJ`z",                   desc = "Combine with line below" },
		{ "<C-d>",      "<C-d>zz",                 desc = "Move half page up" },
		{ "<C-u>",      "<C-u>zz",                 desc = "Move half page down" },
		{ "n",          "nzzzv",                   desc = "Next occurrence" },
		{ "N",          "Nzzzv",                   desc = "Previous occurrence" },
		{ "<leader>e",  vim.diagnostic.open_float, desc = "open diagnostic" },
		{ "[d",         vim.diagnostic.goto_prev,  desc = "previous diagnostic" },
		{ "]d",         vim.diagnostic.goto_next,  desc = "next diagnostic" },
		{ "<Tab>",      "<cmd>bnext<CR>",          desc = "next buffer" },
		{ "<S-Tab>",    "<cmd>bprev<CR>",          desc = "previous buffer" },
		{ "<leader>bn", "<cmd>enew<CR>",           desc = "new buffer" },
		{ "Q",          "<nop>" },
	},
	telescope = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>",                            desc = "find files" },
		{ "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", desc = "find all files" },
		{ "<leader>fw", "<cmd>Telescope live_grep<CR>",                             desc = "find text" },
		{ "<leader>fo", "<cmd>Telescope buffers<CR>",                               desc = "find buffers" },
		{ "<leader>fm", "<cmd>Telescope notify<CR>",                                desc = "find notifications" },
		{
			"<leader>fb",
			"<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
			desc = "file browser",
		},
		{ "<leader>gf", "<cmd>Telescope git_files<CR>",    desc = "git files" },
		{ "<leader>gs", "<cmd>Telescope git_status<CR>",   desc = "git status" },
		{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "git branches" },
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>",  desc = "git commits" },
	},
	dap = {
		{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "toggle breakpoint" },
		{ "<leader>dc", function() require("dap").continue() end,          desc = "continue" },
		{ "<leader>dC", function() require("dap").run_to_cursor() end,     desc = "run to cursor" },
		{ "<leader>dl", function() require("dap").run_last() end,          desc = "run last", },
		{ "<leader>dO", function() require("dap").step_over() end,         desc = "step over" },
		{ "<leader>di", function() require("dap").step_into() end,         desc = "step into" },
		{ "<leader>do", function() require("dap").step_out() end,          desc = "step out" },
		{ "<leader>dj", function() require("dap").down() end,              desc = "go down in stack" },
		{ "<leader>dk", function() require("dap").up() end,                desc = "go up in stack" },
		{ "<leader>dp", function() require("dap").pause() end,             desc = "pause thread" },
		{ "<leader>dt", function() require("dap").terminate() end,         desc = "terminate" },
		{ "<leader>dr", function() require("dap").repl.toggle() end,       desc = "toggle repl" },
		{ "<leader>dh", function() require("dap.ui.widgets").hover() end,  desc = "hover" },
	},
	dap_ui = {
		{ "<leader>du", function() require("dapui").toggle() end, desc = "toggle ui", },
		{ "<leader>de", function() require("dapui").eval() end,   desc = "eval",      mode = { "n", "v" }, },
	},
	trouble = {
		{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
		{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
		{ "<leader>xL", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
		{ "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
		{
			"[q",
			function()
				if require("trouble").is_open() then
					require("trouble").previous({ skip_groups = true, jump = true })
				else
					vim.cmd.cprev()
				end
			end,
			desc = "Previous trouble/quickfix item",
		},
		{
			"]q",
			function()
				if require("trouble").is_open() then
					require("trouble").next({ skip_groups = true, jump = true })
				else
					vim.cmd.cnext()
				end
			end,
			desc = "Next trouble/quickfix item",
		},
	},
	gitsigns = {
		{ "[h",          "<cmd>Gitsigns prev_hunk<CR>",    desc = "previous git hunk" },
		{ "]h",          "<cmd>Gitsigns next_hunk<CR>",    desc = "next git hunk" },
		{ "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>",   desc = "stage hunk",       mode = { "n", "v" } },
		{ "<leader>ghS", "<cmd>Gitsigns stage_buffer<CR>", desc = "stage buffer",     mode = { "n", "v" } },
		{ "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>",   desc = "reset hunk" },
		{ "<leader>ghR", "<cmd>Gitsigns reset_buffer<CR>", desc = "reset buffer" },
		{ "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", desc = "preview hunk" },
		{ "<leader>ghd", "<cmd>Gitsigns diffthis<CR>",     desc = "diff this" },
	},
	todo_comments = {
		{ "]t",         function() require("todo-comments").jump_next() end, desc = "next todo comment", },
		{ "[t",         function() require("todo-comments").jump_prev() end, desc = "previous todo comment", },
		{ "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "todo" },
		{ "<leader>ft", "<cmd>TodoTelescope<cr>",                            desc = "find todos" },
	},
	rust = {
		{ "<leader>ra", "<cmd>RustHoverActions<CR>", desc = "actions" },
		{ "<leader>rr", "<cmd>RustRunnables<CR>",    desc = "runnables" },
		{ "<leader>ru", "<cmd>RustMoveItemUp<CR>",   desc = "move item up" },
		{ "<leader>rd", "<cmd>RustMoveItemUp<CR>",   desc = "move item down" },
		{ "<leader>rC", "<cmd>RustOpenCargo<CR>",    desc = "open cargo.toml" },
	},
	rust_crates = {
		{ "rct", function() require("crates").toggle() end,                  desc = "toggle", },
		{ "rcr", function() require("crates").reload() end,                  desc = "reload", },
		{ "rcv", function() require("crates").show_versions_popup() end,     desc = "versions popup", },
		{ "rcf", function() require("crates").show_features_popup() end,     desc = "features popup", },
		{ "rcd", function() require("crates").show_dependencies_popup() end, desc = "dependencies popup", },
		{ "rcu", function() require("crates").update_crate() end,            desc = "update crate", },
		{ "rcu", function() require("crates").update_crates() end,           desc = "update crate",       mode = "v", },
		{ "rca", function() require("crates").update_all_crates() end,       desc = "update crates", },
		{ "rcU", function() require("crates").upgrade_crate() end,           desc = "upgrade crate", },
		{ "rcU", function() require("crates").upgrade_crates() end,          desc = "upgrade crate",      mode = "v", },
		{ "rcA", function() require("crates").upgrade_all_crates() end,      desc = "upgrade crates", },
		{ "rcH", function() require("crates").open_homepage() end,           desc = "homepage", },
		{ "rcR", function() require("crates").open_repository() end,         desc = "repository", },
		{ "rcD", function() require("crates").open_documentation() end,      desc = "documentation", },
		{ "rcC", function() require("crates").open_crates_io() end,          desc = "crates.io", },
	},
	lsp = {
		{ "gD",         vim.lsp.buf.declaration,                    desc = "go to declaration" },
		{ "K",          vim.lsp.buf.hover,                          desc = "show docs" },
		{ "gd",         "<cmd>Telescope lsp_definitions<CR>",       desc = "go to definitions" },
		{ "gr",         "<cmd>Telescope lsp_references<CR>",        desc = "go to references" },
		{ "gi",         "<cmd>Telescope lsp_implementations<CR>",   desc = "go to implementations" },
		{ "gt",         "<cmd>Telescope lsp_type_definitions<CR>",  desc = "go to type definitions" },
		{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>",  desc = "find symbols in document" },
		{ "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "find symbols in workspace" },
		{
			"<leader>ca",
			vim.lsp.buf.code_action,
			desc = "code actions",
			mode = { "n", "v" },
		},
		{ "<leader>cr", vim.lsp.buf.rename,                                  desc = "rename symbol" },
		{ "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, desc = "format code", },
		{ "<leader>cl", vim.lsp.codelens.refresh,                            desc = "refresh codelens" },
	},
	mini_splitjoin = {
		{ "gS", desc = "toggle argument split" },
	},
	mini_move = {
		{ "<M-h>", desc = "move selection left",  mode = "v" },
		{ "<M-l>", desc = "move selection right", mode = "v" },
		{ "<M-j>", desc = "move selection down",  mode = "v" },
		{ "<M-k>", desc = "move selection up",    mode = "v" },
		{ "<M-h>", desc = "move line left" },
		{ "<M-l>", desc = "move line right" },
		{ "<M-j>", desc = "move line down" },
		{ "<M-k>", desc = "move line up" },
	},
	mini_comment = {
		{ "gc",  desc = "toggle comment",     mode = "v" },
		{ "gcc", desc = "toggle comment line" },
	},
	mini_bufremove = {
		{ "<leader>bd", function() require("mini.bufremove").delete() end, desc = "buffer delete", },
	},
	mini_surround = {
		{ "<leader>sa", desc = "add surrounding",       mode = { "n", "v" } },
		{ "<leader>sd", desc = "delete surrounding" },
		{ "<leader>sf", desc = "find right surrounding" },
		{ "<leader>sF", desc = "find left surrounding" },
		{ "<leader>sh", desc = "highlight surrounding" },
		{ "<leader>sr", desc = "replace surrounding" },
		{ "<leader>sn", desc = "update n lines" },
	},
	flash = {
		{ "s", function() require("flash").jump() end,       desc = "jump (flash)",       mode = { "n", "x", "o" } },
		{ "S", function() require("flash").treesitter() end, desc = "treesitter (flash)", mode = { "n", "x", "o" } },
	},
	go = {
		{ "<leader>oe", "<cmd>GoIfErr<CR>",       desc = "add go if err" },
		{ "<leader>oi", "<cmd>GoImpl<CR>",        desc = "add go implementation" },
		{ "<leader>oj", "<cmd>GoTagAdd json<CR>", desc = "add json tag" },
		{ "<leader>oy", "<cmd>GoTagAdd yaml<CR>", desc = "add yaml tag" },
	},
}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("rsandor.util").load_keymaps(keymaps.base)

return keymaps
