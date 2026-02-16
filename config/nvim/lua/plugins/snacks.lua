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
      prompt = " ❯ ",
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

    vim.keymap.set(
      "n",
      "<Leader><Leader>",
      snacks.picker.pickers,
      { desc = "Pickers (Snacks)" }
    )

    vim.keymap.set("n", "<C-p>", function()
      snacks.picker.smart({ multi = { "git_files", "files" } })
    end, { desc = "File picker (Snacks)" })

    vim.keymap.set("n", "<Leader>/", snacks.picker.grep, { desc = "Grep (Snacks)" })
    vim.keymap.set(
      "n",
      "<Leader>sb",
      snacks.picker.lines,
      { desc = "Buffer lines (Snacks)" }
    )
    vim.keymap.set(
      "n",
      "<Leader>sd",
      snacks.picker.diagnostics,
      { desc = "Diagnostics (Snacks)" }
    )
    vim.keymap.set(
      "n",
      "<Leader>sr",
      snacks.picker.resume,
      { desc = "Resume picker (Snacks)" }
    )
    vim.keymap.set(
      "n",
      "<Leader>sw",
      snacks.picker.grep_word,
      { desc = "Grep word (Snacks)" }
    )

    vim.keymap.set(
      "n",
      "<Leader>b",
      snacks.gitbrowse.open,
      { desc = "Git browse (Snacks)" }
    )
    vim.keymap.set(
      "n",
      "<Leader>e",
      snacks.explorer.open,
      { desc = "Explorer (Snacks)" }
    )
  end,
}
