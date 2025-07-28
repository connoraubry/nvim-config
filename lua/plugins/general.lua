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
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
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
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    opts = {}
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      hint_enable = false
    }
  }
}
