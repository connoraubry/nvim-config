return {
  {
    "folke/snacks.nvim",

    opts = {
      animate = { enabled = false },
      scroll = { enabled = false },
      explorer = {},
    },
    keys = {

      { "<leader>sb", false },
      { "<leader>sB", false },
      { "<leader>sg", false },
      { "<leader>sG", false },
      { "<leader>sw", false },
      { "<leader>sW", false },
      -- search
      { '<leader>s"', false },
      { "<leader>s/", false },
      { "<leader>sa", false },
      { "<leader>sb", false },
      { "<leader>sc", false },
      { "<leader>sC", false },
      { "<leader>sd", false },
      { "<leader>sD", false },
      { "<leader>sh", false },
      { "<leader>sH", false },
      { "<leader>si", false },
      { "<leader>sj", false },
      { "<leader>sk", false },
      { "<leader>sl", false },
      { "<leader>sm", false },
      { "<leader>sM", false },
      { "<leader>sp", false },
      { "<leader>sq", false },
      { "<leader>sR", false },
      { "<leader>su", false },
      { "<leader>st", false },

      { "<leader>ss", false },
      { "<leader>sS", false },

      --replace
      -- { "<leader>fb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      {
        "<leader>fB",
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = "Grep Open Buffers",
      },
      {
        "<leader>fs",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>fw",
        function()
          Snacks.picker.grep_word()
        end,
        desc = "Visual selection or word",
        mode = { "n", "x" },
      },
      -- search
      {
        '<leader>f"',
        function()
          Snacks.picker.registers()
        end,
        desc = "Registers",
      },
      {
        "<leader>f/",
        function()
          Snacks.picker.search_history()
        end,
        desc = "Search History",
      },
      {
        "<leader>fa",
        function()
          Snacks.picker.autocmds()
        end,
        desc = "Autocmds",
      },
      {
        "<leader>fb",
        function()
          Snacks.picker.lines()
        end,
        desc = "Buffer Lines",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Command History",
      },
      {
        "<leader>fC",
        function()
          Snacks.picker.commands()
        end,
        desc = "Commands",
      },
      {
        "<leader>fd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>fD",
        function()
          Snacks.picker.diagnostics_buffer()
        end,
        desc = "Buffer Diagnostics",
      },
      -- { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
      -- { "<leader>fH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      -- { "<leader>fi", function() Snacks.picker.icons() end, desc = "Icons" },
      -- { "<leader>fj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      -- { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      -- { "<leader>fl", function() Snacks.picker.loclist() end, desc = "Location List" },
      -- { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
      -- { "<leader>fM", function() Snacks.picker.man() end, desc = "Man Pages" },
      -- { "<leader>fp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      -- { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      -- { "<leader>fR", function() Snacks.picker.resume() end, desc = "Resume" },
      -- { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo History" },
      {
        "<leader>fl",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "LSP Symbols",
      },
      {
        "<leader>fL",
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = "LSP Workspace Symbols",
      },
    },
  },
}
