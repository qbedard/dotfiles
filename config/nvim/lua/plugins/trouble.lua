require("trouble").setup({ use_diagnostic_signs = true })

local map = vim.keymap.set
map(
  "n",
  "<Leader>xx",
  "<Cmd>Trouble diagnostics toggle<CR>",
  { desc = "Diagnostics (Trouble)" }
)
map(
  "n",
  "<Leader>xd",
  "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>",
  { desc = "Buffer diagnostics (Trouble)" }
)
map(
  "n",
  "<Leader>xl",
  "<Cmd>Trouble loclist toggle<CR>",
  { desc = "Location list (Trouble)" }
)
map("n", "<Leader>xc", "<Cmd>Trouble qflist toggle<CR>", { desc = "Quickfix (Trouble)" })
map(
  "n",
  "gR",
  "<Cmd>Trouble lsp_references toggle<CR>",
  { desc = "LSP references (Trouble)" }
)
