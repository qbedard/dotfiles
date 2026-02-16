return {
  "folke/trouble.nvim",
  dependencies = "nvim-mini/mini.nvim",
  keys = {
    {
      "<Leader>xx",
      "<Cmd>Trouble diagnostics toggle<CR>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<Leader>xd",
      "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Buffer diagnostics (Trouble)",
    },
    {
      "<Leader>xl",
      "<Cmd>Trouble loclist toggle<CR>",
      desc = "Location list (Trouble)",
    },
    { "<Leader>xc", "<Cmd>Trouble qflist toggle<CR>", desc = "Quickfix (Trouble)" },
    {
      "gR",
      "<Cmd>Trouble lsp_references toggle<CR>",
      desc = "LSP references (Trouble)",
    },
  },
  opts = { use_diagnostic_signs = true },
}
