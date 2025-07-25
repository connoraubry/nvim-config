return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        "css", "c", "vim", "query", "lua", "go", "python", "javascript"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enabled = true,
        additional_vim_regex_highlighting = false,
      },
      autotag = { enable = true},
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ":TSUpdate",
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      enable = true,
      max_lines = 0,
      max_window_height = 0,
      line_numbers = true
    }
  }

}
