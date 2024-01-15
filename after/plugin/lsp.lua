local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, buffr)
    local opts = {buffer = buffr, remap = false}
    lsp_zero.default_keymaps({buffer = bufnr})


    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {'gopls', 'pylsp'},
    handlers = {
        lsp_zero.default_setup,
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require("lsp-zero").cmp_action()
cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        -- {name = 'nvim_lua'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
    },
    -- snippet = {
    --     expand = function(args)
    --         require('luasnip').lsp_expand(args.body)
    --     end,
    -- },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true 
        }),  
        ['<Tab>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true 
        }),  

        ['<C-Space>'] = cmp.mapping.complete(),

        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),  
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), 
        -- ['<Tab>'] = cmp.mapping.confirm({select = true }),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})

-- require("luasnip.loaders.from_vscode").lazy_load()



-- lsp_zero.setup()