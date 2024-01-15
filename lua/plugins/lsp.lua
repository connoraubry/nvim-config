return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/cmp-nvim-lsp'},
      { "williamboman/mason.nvim" },
      {"williamboman/mason-lspconfig.nvim"},
      {'hrsh7th/nvim-cmp'},
      {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },

      },
    }
  }
}