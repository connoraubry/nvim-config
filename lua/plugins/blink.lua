return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<Tab>"] = {
          require("blink.cmp.keymap.presets").get("super-tab")["<Tab>"][1],
          require("lazyvim.util.cmp").map({ "snippet_forward", "ai_accept" }),
          "fallback",
        },
      },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      -- cfg options
      hint_enable = false,
    },
  },
}
