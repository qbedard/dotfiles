local i = require("icons")

return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-mini/mini.nvim",
  opts = {
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        {
          function()
            local git_dir = require("lualine.components.branch.git_branch").find_git_dir()
            if git_dir then
              local path_elems = vim.split(git_dir, "/")
              return path_elems[#path_elems - 1]
            end
            return ""
          end,
          padding = { left = 1, right = 0 },
          separator = "",
        },
        { "branch", icon = i.git.branch },
      },
      lualine_c = {
        {
          "diff",
          symbols = {
            added = i.diff.add_,
            modified = i.diff.mod_,
            removed = i.diff.del_,
          },
        },
        {
          "filename",
          path = 1,
          symbols = { modified = i.file._mod, readonly = i.file._lock },
        },
      },
      lualine_x = {
        -- {
        --   require("noice").api.statusline.mode.get,
        --   cond = require("noice").api.statusline.mode.has,
        --   color = "CursorLineNr",
        -- },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          diagnostics_color = { info = { fg = "#83a598" } },
          symbols = {
            error = i.diag.error_,
            warn = i.diag.warn_,
            info = i.diag.info_,
            hint = i.diag.hint_,
          },
        },
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "%3l:%-2c" },
    },
    extensions = { "fugitive" },
  },
}
