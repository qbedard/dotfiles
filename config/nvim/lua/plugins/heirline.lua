local i = require("icons")

return {
  "rebelot/heirline.nvim",
  dependencies = "kyazdani42/nvim-web-devicons",
  enabled = false,
  opts = function()
    local utils = require("heirline.utils")

    local colors = {
      bright_bg = utils.get_highlight("GruvboxBg1").bg,
      bright_fg = utils.get_highlight("GruvboxFg1").fg,
      red = utils.get_highlight("GruvboxRed").fg,
      dark_red = utils.get_highlight("DiffDelete").bg,
      green = utils.get_highlight("GruvboxGreen").fg,
      blue = utils.get_highlight("GruvboxBlue").fg,
      gray = utils.get_highlight("GruvboxGray").fg,
      orange = utils.get_highlight("GruvboxOrange").fg,
      purple = utils.get_highlight("GruvboxPurple").fg,
      cyan = utils.get_highlight("GruvboxAqua").fg,
      diag_warn = utils.get_highlight("DiagnosticWarn").fg,
      diag_error = utils.get_highlight("DiagnosticError").fg,
      diag_hint = utils.get_highlight("DiagnosticHint").fg,
      diag_info = utils.get_highlight("DiagnosticInfo").fg,
      git_del = utils.get_highlight("diffRemoved").fg,
      git_add = utils.get_highlight("diffAdded").fg,
      git_change = utils.get_highlight("diffChanged").fg,
    }

    require('heirline').load_colors(colors)

    local ViMode = {
      init = function(self)
        self.mode = vim.fn.mode(1)

        if not self.once then
          vim.api.nvim_create_autocmd("ModeChanged", {
            pattern = "*:*o",
            command = "redrawstatus",
          })
          self.once = true
        end
      end,
      static = {
        mode_names = {
          n = "N",
          no = "N?",
          nov = "N?",
          noV = "N?",
          ["no\22"] = "N?",
          niI = "Ni",
          niR = "Nr",
          niV = "Nv",
          nt = "Nt",
          v = "V",
          vs = "Vs",
          V = "V_",
          Vs = "Vs",
          ["\22"] = "^V",
          ["\22s"] = "^V",
          s = "S",
          S = "S_",
          ["\19"] = "^S",
          i = "I",
          ic = "Ic",
          ix = "Ix",
          R = "R",
          Rc = "Rc",
          Rx = "Rx",
          Rv = "Rv",
          Rvc = "Rv",
          Rvx = "Rv",
          c = "C",
          cv = "Ex",
          r = "...",
          rm = "M",
          ["r?"] = "?",
          ["!"] = "!",
          t = "T",
        },
        mode_colors = {
          n = "gray",
          i = "green",
          v = "cyan",
          V = "cyan",
          ["\22"] = "cyan",
          c = "orange",
          s = "purple",
          S = "purple",
          ["\19"] = "purple",
          R = "orange",
          r = "orange",
          ["!"] = "red",
          t = "red",
        },
      },
      provider = function(self)
        return "%2(" .. self.mode_names[self.mode] .. "%)"
      end,
      hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { fg = self.mode_colors[mode], bold = true }
      end,
      update = { "ModeChanged" },
    }

    local statusline = {
      ViMode,
      -- "branch",
      -- "diff", -- added, modified, removed
      -- "filename", -- name, modified, readonly
      -- "diagnostics", -- error, warn, info, hint
      -- "filetype",
      -- "progress",
      -- "line:column",
    }


    return {
      -- statuscolumn = {},
      statusline = statusline,
      -- tabline = {},
      -- winbar = {},
    }
  end,
}
