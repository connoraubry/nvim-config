vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>pd", vim.cmd.Ex, { desc = "Print directory" })

--window navigation
vim.keymap.set("n", "<leader>wv", "<C-w>v<C-w>w", { desc = "Open Vertical window, change" })
vim.keymap.set("n", "<leader>ws", "<C-w>s<C-w>w", { desc = "Open Horizontal window, change" })

vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Go to below window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Go to above window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Down page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Up page" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search" })

-- --
-- vim.keymap.set("x", "<leader>p", "\"_dP")
--
-- -- remap <leader>y to use the system clipboard
-- vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")
--

-- don't change registers when using 'x' to delete
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "X", '"_d')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- getting rid of some keys
vim.keymap.set("n", "Q", "<nop>")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.keymap.set("n", "<leader>tt", ":TodoTelescope<CR>", { desc = "[T}odo [T]elescope" })
vim.keymap.set("n", "<leader>tq", ":TodoQuickFix<CR>", { desc = "[T}odo [Q]uick" })

vim.keymap.set("n", "<leader>zz", function()
	vim.opt_local.spell = not vim.opt_local.spell:get()
	local status = vim.opt_local.spell:get() and "enabled" or "disabled"
	vim.notify("Spell " .. status)
end, { desc = "Toggle Spellcheck" })

vim.keymap.set("n", "<leader>zn", "]s", { desc = "Next spell error" })
vim.keymap.set("n", "<leader>zp", "[s", { desc = "Prev spell error" })
vim.keymap.set("n", "<leader>za", "zg", { desc = "Add word to dictionary" })
vim.keymap.set("n", "<leader>zr", "zw", { desc = "Remove word (mark wrong)" })
vim.keymap.set("n", "<leader>zf", function()
	require("telescope.builtin").spell_suggest()
end, { desc = "Fix spelling (Telescope)" })
