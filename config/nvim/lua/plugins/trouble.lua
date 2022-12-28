local icons = require("icons")

return {
  "folke/trouble.nvim",
  lazy = false,
  dependencies = "kyazdani42/nvim-web-devicons",
  keys = {
    {
      "<Leader>xx",
      function()
        require("trouble").toggle()
      end,
    },
    {
      "<Leader>xw",
      function()
        require("trouble").toggle("workspace_diagnostics")
      end,
    },
    {
      "<Leader>xd",
      function()
        require("trouble").toggle("document_diagnostics")
      end,
    },
    {
      "<Leader>xl",
      function()
        require("trouble").toggle("loclist")
      end,
    },
    {
      "<Leader>xc",
      function()
        require("trouble").toggle("quickfix")
      end,
    },
    {
      "gR",
      function()
        require("trouble").toggle("lsp_references")
      end,
    },
  },
  config = {
    signs = {
      error = icons.diag.error,
      warning = icons.diag.warn,
      hint = icons.diag.hint,
      information = icons.diag.info,
      other = icons.diag.pass,
    },
  },
}
