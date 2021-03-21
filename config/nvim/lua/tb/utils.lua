local M = {}

function M.term_codes(s)
  return vim.api.nvim_replace_termcodes(s, true, true, true)
end

function M.map(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", {noremap = true}, opts or {})
  for i = 1, #mode do
    vim.api.nvim_set_keymap(mode:sub(i, i), lhs, rhs, opts)
  end
end

function M.mapx(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", {expr = true, silent = true}, opts or {})
  return M.map(mode, lhs, rhs, opts)
end

return M
