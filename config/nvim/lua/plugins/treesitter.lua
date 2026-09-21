-- Rebuild parsers when nvim-treesitter's code changes (replaces lazy.nvim's
-- `build = ":TSUpdate"`). Only handles updates: fresh installs pull parsers via
-- the `install()` call below, and `:TSUpdate` isn't available until the plugin
-- is loaded (which it is by the time `:packupdate` can run).
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
      vim.cmd("TSUpdate")
    end
  end,
})

require("nvim-treesitter").install({ "stable", "unstable" })
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.treesitter.language.register("terraform", "terraform-vars")

require("nvim-treesitter-textobjects").setup()
local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")
local swap = require("nvim-treesitter-textobjects.swap")

-- select
for _, map in ipairs({
  { "af", "@function.outer" },
  { "if", "@function.inner" },
  { "ac", "@class.outer" },
  { "ic", "@class.inner" },
}) do
  vim.keymap.set({ "x", "o" }, map[1], function()
    select.select_textobject(map[2], "textobjects")
  end)
end

-- move
for _, map in ipairs({
  { "]m", "@function.outer", "goto_next_start" },
  { "]]", "@class.outer", "goto_next_start" },
  { "]M", "@function.outer", "goto_next_end" },
  { "][", "@class.outer", "goto_next_end" },
  { "[m", "@function.outer", "goto_previous_start" },
  { "[[", "@class.outer", "goto_previous_start" },
  { "[M", "@function.outer", "goto_previous_end" },
  { "[]", "@class.outer", "goto_previous_end" },
}) do
  local fn = move[map[3]]
  vim.keymap.set({ "n", "x", "o" }, map[1], function()
    fn(map[2], "textobjects")
  end)
end

-- swap
vim.keymap.set("n", "<leader>l", function()
  swap.swap_next("@parameter.inner", "textobjects")
end)
vim.keymap.set("n", "<leader>h", function()
  swap.swap_previous("@parameter.inner", "textobjects")
end)

require("nvim-ts-autotag").setup({
  filetypes = { "html", "javascriptreact", "xml" },
})
