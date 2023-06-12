local keymaps = {
	base = {
		{ "<esc>", "<cmd>nohl<CR>", desc = "remove search highlight" },
		{ "J",     "mzJ`z",         desc = "Combine with line below" },
		{ "<C-d>", "<C-d>zz",       desc = "Move half page up" },
		{ "<C-u>", "<C-u>zz",       desc = "Move half page down" },
		{ "n",     "nzzzv",         desc = "Next occurrence" },
		{ "N",     "Nzzzv",         desc = "Previous occurrence" },
		{ "Q",     "<nop>" },
	},
	telescope = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>",                            desc = "find files" },
		{ "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", desc = "find all files" },
		{ "<leader>fw", "<cmd>Telescope live_grep<CR>",                             desc = "find text" },
		{ "<leader>fo", "<cmd>Telescope buffers<CR>",                               desc = "find buffers" },
		{ "<leader>fb", "<cmd>Telescope file_browser<CR>",                          desc = "file browser" },
		{ "<leader>gf", "<cmd>Telescope git_files<CR>",                             desc = "git files" },
		{ "<leader>gs", "<cmd>Telescope git_status<CR>",                            desc = "git status" },
		{ "<leader>gb", "<cmd>Telescope git_branches<CR>",                          desc = "git branches" },
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>",                           desc = "git commits" },
	},
	dap = {
		{ "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "toggle breakpoint" },
		{ "<leader>dc", "<cmd>DapContinue<CR>",         desc = "continue" },
		{ "<leader>dT", "<cmd>DapTerminate<CR>",        desc = "terminate" },
		{
			"<leader>dl",
			function()
				require("dap").run_last()
			end,
			desc = "run last",
		},
		{
			"<leader>dh",
			function()
				require("dap.ui.widgets").hover()
			end,
			desc = "hover",
		},
		{ "<leader>dss", "<cmd>DapStepOver<CR>", desc = "step over" },
		{ "<leader>dsi", "<cmd>DapStepInto<CR>", desc = "step into" },
		{ "<leader>dso", "<cmd>DapStepOver<CR>", desc = "step over" },
	},
	dap_ui = {
		{
			"<leader>dut",
			function()
				require("dapui").toggle()
			end,
			desc = "toggle ui",
		},
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
}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

for _, keymap in ipairs(keymaps.base) do
	local mode = keymap.mode or "n"
	local desc = keymap.desc or ""
	vim.keymap.set(mode, keymap[1], keymap[2], { desc = desc })
end

return keymaps
