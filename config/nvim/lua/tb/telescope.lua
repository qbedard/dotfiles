local telescope = require("telescope")
local actions = require("telescope.actions")

-- Setup
telescope.setup({
  defaults = {
    layout_strategy = "flex",
    layout_config = {
      flex = {
        flip_columns = 160,
        horizontal = { preview_width = 0.5 },
        vertical = { preview_height = 0.4 },
      },
    },
    mappings = {
      i = {
        ["<CR>"] = actions.select_default + actions.center,
        ["<esc>"] = actions.close,
        ["<tab>"] = actions.add_selection,
      },
    },
    color_devicons = true,
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
  },
  pickers = {
    find_files = {
      find_command = {
        "fd",
        "--type",
        "f",
        "--strip-cwd-prefix",
        "--hidden",
        "--follow",
        "--no-ignore-vcs",
      },
    },
  },
})

-- Extensions
telescope.load_extension("fzf")

local M = {}

-- Pickers
M.project_files = function()
  require("telescope.builtin").find_files({
    cwd = require("lspconfig.util").root_pattern(".git")(
      vim.fn.expand("%:p") or vim.loop.cwd()
    ),
  })
end

return M
