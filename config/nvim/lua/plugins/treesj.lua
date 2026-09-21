require("treesj").setup({
  max_join_length = 512,
  use_default_keymaps = false,
})

local function get_pos_lang(node)
  local c = vim.api.nvim_win_get_cursor(0)
  local range = { c[1] - 1, c[2], c[1] - 1, c[2] }
  local buf = vim.api.nvim_get_current_buf()
  local ok, parser = pcall(
    vim.treesitter.get_parser,
    buf,
    vim.treesitter.language.get_lang(vim.bo[buf].ft)
  )
  if not ok then
    return ""
  end
  ---@diagnostic disable-next-line: need-check-nil
  local current_tree = parser:language_for_range(range)
  return current_tree:lang()
end

vim.keymap.set({ "n", "v" }, "gS", function()
  local tsj_langs = require("treesj.langs")["presets"]
  local lang = get_pos_lang()
  if lang ~= "" and tsj_langs[lang] then
    require("treesj").toggle()
  else
    require("mini.splitjoin").toggle()
  end
end)
