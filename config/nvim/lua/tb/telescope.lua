local telescope = require("telescope")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

-- Setup
telescope.setup {
  defaults = {
    layout_strategy = "flex",
    -- layout_defaults = {flip_columns = 160},
    preview_cutoff = 10,
    results_height = 1,
    mappings = {
      i = {
        ["<CR>"] = actions.select_default + actions.center,
        ["<esc>"] = actions.close,
        ["<tab>"] = actions.add_selection
      }
    },
    color_devicons = true,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new
  }
}

-- TODO: Reduce preview ratio
-- Override flex layout
local layout_strategies = require("telescope.pickers.layout_strategies")
local config = require("telescope.config")

layout_strategies.flex = function(self, max_columns, max_lines)
  local layout_config = self.layout_config or {}

  local flip_columns = layout_config.flip_columns or 160 -- Here's why.
  local flip_lines = layout_config.flip_lines or 20

  if max_columns < flip_columns and max_lines > flip_lines then
    self.layout_config = (config.values.layout_defaults or {})["vertical"]
    return layout_strategies.vertical(self, max_columns, max_lines)
  else
    self.layout_config = (config.values.layout_defaults or {})["horizontal"]
    return layout_strategies.horizontal(self, max_columns, max_lines)
  end
end

-- Extensions
telescope.load_extension("fzy_native")
telescope.load_extension("gh")
-- telescope.load_extension("packer")  -- currently breaking packer

local M = {}

-- Pickers
M.project_files = function()
  require("telescope.builtin").find_files {
    cwd = require("lspconfig.util").root_pattern(".git")(vim.fn.expand("%:p"))
  }
end

return M
