vim.opt.number = true
vim.opt.relativenumber = true


-- tab options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- search options
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- color options
vim.opt.termguicolors = true

-- scroll options
vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "number"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.colorcolumn = "80"

-- schedule to keep start time quick
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- kickstart nvim
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.confirm = true
