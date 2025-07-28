return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true, version = "^1.0.0"},
    {'williamboman/mason-lspconfig.nvim', version = "^1.0.0"},

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    {'folke/neodev.nvim', opts = {}},
  },
}
