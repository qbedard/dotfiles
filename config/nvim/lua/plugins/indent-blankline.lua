return {
  "lukas-reineke/indent-blankline.nvim",
  opts = {
    char = require("icons").bar.thin,
    char_highlight_list = { "GruvboxBg1", "GruvboxBg2" },
    -- context_highlight_list = { "GruvboxAqua" },
    buftype_exclude = { "help", "nofile", "prompt", "quickfix", "terminal" },
    filetype_exclude = { "text", "markdown" },
    -- show_current_context = true,
    show_first_indent_level = false,
    show_trailing_blankline_indent = false,
  },
  -- enabled = false,
}
