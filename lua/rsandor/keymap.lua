vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<esc>", "<cmd>nohl<CR>", { desc = "remove search highlight" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Combine with line below" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move half page up" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move half page down" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next occurrence" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous occurrence" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Delete to void registry and paste" })

vim.keymap.set("n", "Q", "<nop>", {})
