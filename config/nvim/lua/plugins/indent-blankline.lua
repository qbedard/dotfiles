return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    exclude = {
      filetypes = { "text", "markdown" },
      buftypes = { "help", "nofile", "prompt", "quickfix", "terminal" },
    },
    indent = {
      char = require("icons").bar.thin,
      highlight = { "GruvboxBg1", "GruvboxBg2" },
    },
    scope = {
      highlight = { "GruvboxAqua" },
    },
    whitespace = { remove_blankline_trail = true },
  },
}
