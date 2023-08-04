local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)




lsp.on_attach(function(client, buffr)
    local opts = {buffer = buffr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

lsp.setup()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmap_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),  
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),  
    ['<CR>'] = cmp.mapping.confirm( {select = true }),  

    --['<C-Space>'] = cmp.mapping.complete(),
})
cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({select = true }),
        ['<CR>'] = cmp.mapping.confirm({select = true }),
    }
})
