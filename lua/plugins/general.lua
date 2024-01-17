return {
    -- add gruvbox
    {
        "morhetz/gruvbox",
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
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
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
    }
}
