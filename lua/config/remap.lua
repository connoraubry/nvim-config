vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pd", vim.cmd.Ex, { desc = "Print directory" })

--window navigation
--
vim.keymap.set("n", "<leader>w", "<C-w>w", { desc = "Change active window" })
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Vertical split" })
-- vim.keymap.set("n", "<leader>s", "<C-w>s", { desc = "Horizontal split" })
-- vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Go to left window" })
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
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.keymap.set("n", "<leader>tt", ":TodoTelescope<CR>", { desc = "[T}odo [T]elescope" })
vim.keymap.set("n", "<leader>tq", ":TodoQuickFix<CR>", { desc = "[T}odo [Q]uick" })

vim.keymap.del("n", "<leader>ss")
vim.keymap.del("n", "<leader>sT")
