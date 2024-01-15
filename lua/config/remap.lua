vim.keymap.set("n", "<leader>pd", vim.cmd.Ex)

--window navigation
vim.keymap.set("n", "<leader>w", "<C-w>w", {desc = "Change active window"})
vim.keymap.set("n", "<leader>v", "<C-w>v", {desc = "Vertical split"})
vim.keymap.set("n", "<leader>s", "<C-w>s", {desc = "Horizontal split"})
vim.keymap.set("n", "<leader>h", "<C-w>h", {desc = "Go to left window"})
vim.keymap.set("n", "<leader>j", "<C-w>j", {desc = "Go to below window"})
vim.keymap.set("n", "<leader>k", "<C-w>k", {desc = "Go to above window"})
vim.keymap.set("n", "<leader>l", "<C-w>l", {desc = "Go to right window"})



vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv") 
vim.keymap.set("n", "N", "Nzzzv") 

-- 
vim.keymap.set("x", "<leader>p", "\"_dP")

-- remap <leader>y to use the system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")


-- don't change registers when using 'x' to delete
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- getting rid of some keys
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
