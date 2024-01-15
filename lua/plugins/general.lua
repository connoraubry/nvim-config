return {
    -- add gruvbox
    { "morhetz/gruvbox" },
  
    {
        "fatih/vim-go"
    },
    {
        "windwp/nvim-autopairs",
        lazy = false,
    },
    {
        "windwp/nvim-ts-autotag",
        lazy = false,
    },
    -- {
    --     "sbdchd/neoformat"
    -- },
    {
        "nvim-lualine/lualine.nvim",
        opts = {},
        lazy = false,
    },
    {
        "nvim-tree/nvim-web-devicons"
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl", 
        opts = {}
    },
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },

}
