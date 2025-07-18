return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
        vim.cmd.colorscheme("gruvbox")
    end
  },
  {
    "fatih/vim-go"
  },
  {
    "wellle/targets.vim"
  },
  {
    "windwp/nvim-autopairs",
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        enabled = false
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = {}
  },
  {
    "mbbill/undotree",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      use_diagnostic_signs = true,
    },
  },
  {
    "tpope/vim-surround",
  },
  {
    "tpope/vim-sleuth",
  },
  {
    "tpope/vim-unimpaired",
  },
  {
    "tpope/vim-abolish",
  }
}
