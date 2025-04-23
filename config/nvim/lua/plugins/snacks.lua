return {
  "folke/snacks.nvim",
  dependencies = "ellisonleao/gruvbox.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = {},
    explorer = {},
    gitbrowse = {},
    indent = {
      hl = { "GruvboxBg1", "GruvboxBg2" }, -- TODO: Find out why this isn't working.
      -- scope = { hl = { "GruvboxAqua" } },
      animate = { duration = { step = 5 } },
    },
    input = {},
    notifier = {},
    picker = {
      win = {
        input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } },
      },
    },
    -- quickfile = {},
    -- scope = {},
    -- words = { debounce = 100 },
  },
  init = function()
    local snacks = require("snacks")

    vim.keymap.set("n", "<C-p>", function()
      snacks.picker.smart({ multi = { "git_files", "files" } })
    end)
    vim.keymap.set("n", "<Leader><Leader>", snacks.picker.pickers)
    vim.keymap.set("n", "<Leader>b", snacks.gitbrowse.open)
    vim.keymap.set("n", "<Leader>e", snacks.explorer.open)
  end,
  keys = {
    { "<C-p>", desc = "File Picker" },
    { "<Leader><Leader>", desc = "Picker Picker" },
  },
}
