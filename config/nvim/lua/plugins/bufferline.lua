return {
  "akinsho/bufferline.nvim",
  event = "BufWinEnter",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      highlights = {
        buffer_selected = { italic = false },
        indicator_selected = {
          fg = { attribute = "fg", highlight = "GruvboxBlue" },
        },
      },
      options = {
        enforce_regular_tabs = true,
        modified_icon = require("icons").file.mod,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })
  end,
}
