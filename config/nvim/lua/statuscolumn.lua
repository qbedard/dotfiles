local icons = require("icons")

if _G.StatusColumn then
  return
end

local function highlight(hl, extra)
  if vim.v.relnum == 0 then
    if extra then
      return "%#CursorLineNr#"
    else
      return "%#CursorLine#"
    end
  else
    return hl
  end
end

_G.StatusColumn = {
  handler = {
    fold = function()
      local lnum = vim.fn.getmousepos().line

      -- Only lines with a mark should be clickable
      if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
        return
      end

      local state
      if vim.fn.foldclosed(lnum) == -1 then
        state = "close"
      else
        state = "open"
      end

      vim.cmd.execute("'" .. lnum .. "fold" .. state .. "'")
    end,
  },

  display = {
    line = function()
      if vim.v.wrap then
        return ""
      end

      local lnum = tostring(vim.v.lnum)
      -- Prevent adding a tenth line from bumping the size of the column
      if #lnum == 1 then
        return " " .. lnum
      else
        return lnum
      end
    end,

    fold = function()
      if vim.v.wrap then
        return ""
      end

      local lnum = vim.v.lnum
      local icon = " "

      -- Line isn't in folding range
      if vim.fn.foldlevel(lnum) <= 0 then
        return icon
      end

      -- Not the first line of folding range
      if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
        return icon
      end

      -- TODO: Differentiate levels with highlight
      if vim.fn.foldclosed(lnum) == -1 then
        icon = icons.fold.expanded_thin
      else
        icon = icons.fold.collapsed_thin
      end

      return icon
    end,
  },

  sections = {
    sign_column = { highlight("%#SignColumn#"), "%s" },
    line_number = { highlight("%#LineNr#"), "%=%{v:lua.StatusColumn.display.line()}" },
    spacing = { " " },
    folds = {
      highlight("%#FoldColumn#"),
      "%@v:lua.StatusColumn.handler.fold@",
      "%{v:lua.StatusColumn.display.fold()}",
    },
    border = { highlight("%#StatusColumnBorder#"), icons.bar.thin },
    padding = { highlight("%#StatusColumnBuffer#"), " " },
  },

  build = function(tbl)
    local statuscolumn = {}

    for _, value in ipairs(tbl) do
      if type(value) == "string" then
        table.insert(statuscolumn, value)
      elseif type(value) == "table" then
        table.insert(statuscolumn, StatusColumn.build(value))
      end
    end

    return table.concat(statuscolumn)
  end,

  set_window = function(value)
    vim.defer_fn(function()
      vim.api.nvim_set_option_value(
        "statuscolumn",
        value,
        { win = vim.api.nvim_get_current_win() }
      )
    end, 1)
  end,
}

vim.opt.foldcolumn = "1"
vim.opt.statuscolumn = StatusColumn.build({
  StatusColumn.sections.sign_column,
  StatusColumn.sections.folds,
  StatusColumn.sections.line_number,
  StatusColumn.sections.spacing,
  -- StatusColumn.sections.border,
  -- StatusColumn.sections.padding,
})
