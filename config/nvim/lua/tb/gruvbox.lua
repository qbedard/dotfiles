-- match the fold column colors to the line number column
-- Note: must come after colorscheme gruvbox
-- vim.cmd("highlight clear FoldColumn")
-- vim.cmd("highlight! link FoldColumn LineNr")

-- treesitter highlights
vim.cmd("highlight! link TSConstBuiltin Constant") -- None
vim.cmd("highlight! link TSKeywordOperator Keyword") -- not, in
vim.cmd("highlight! link TSOperator GruvboxRed")
vim.cmd("highlight! link TSFunction GruvboxAqua")
vim.cmd("highlight! link TSMethod GruvboxAqua")
vim.cmd("highlight! clear TSError")

-- misc
vim.cmd("highlight! link DiffChange GruvboxBlue")
-- vim.cmd("highlight! link GitGutterChange GruvboxBlue") -- for gitsigns

----

-- vim.cmd("highlight! link TSPunctDelimiter Delimiter") -- , . etc
-- vim.cmd("highlight! link TSPunctBracket Delimiter")
-- vim.cmd("highlight! link TSPunctSpecial Delimiter")
-- vim.cmd("highlight! link TSConstant Constant")
-- vim.cmd("highlight! link TSConstBuiltin Special") -- None, etc
-- vim.cmd("highlight! link TSConstMacro Define")
-- vim.cmd("highlight! link TSString String")
-- vim.cmd("highlight! link TSStringRegex String")
-- vim.cmd("highlight! link TSStringEscape SpecialChar")
-- vim.cmd("highlight! link TSCharacter Character")
-- vim.cmd("highlight! link TSNumber Number")
-- vim.cmd("highlight! link TSBoolean Boolean")
-- vim.cmd("highlight! link TSFloat Float")

-- vim.cmd("highlight! link TSFunction Function")
-- vim.cmd("highlight! link TSFuncBuiltin Special") -- print()
-- vim.cmd("highlight! link TSFuncMacro Macro")
-- vim.cmd("highlight! link TSParameter Identifier")
-- vim.cmd("highlight! link TSParameterReference TSParameter")
-- vim.cmd("highlight! link TSMethod Function")
-- vim.cmd("highlight! link TSField Identifier")
-- vim.cmd("highlight! link TSProperty Identifier")
-- vim.cmd("highlight! link TSConstructor Special") -- __init__()
-- vim.cmd("highlight! link TSAnnotation PreProc")
-- vim.cmd("highlight! link TSAttribute PreProc")
-- vim.cmd("highlight! link TSNamespace Include")

-- vim.cmd("highlight! link TSConditional Conditional") -- if
-- vim.cmd("highlight! link TSRepeat Repeat") -- for, while
-- vim.cmd("highlight! link TSLabel Label")
-- vim.cmd("highlight! link TSOperator Operator")
-- vim.cmd("highlight! link TSKeyword Keyword")
-- vim.cmd("highlight! link TSKeywordFunction Keyword")
-- vim.cmd("highlight! link TSKeywordOperator Operator") -- not, in
-- vim.cmd("highlight! link TSException Exception")

-- vim.cmd("highlight! link TSType Type")
-- vim.cmd("highlight! link TSTypeBuiltin Type")
-- vim.cmd("highlight! link TSInclude Include")

-- vim.cmd("highlight! link TSVariableBuiltin Special") -- self

-- vim.cmd("highlight! link TSText TSNone")
-- vim.cmd("highlight! TSStrong term=bold cterm=bold gui=bold")
-- vim.cmd("highlight! TSEmphasis term=italic cterm=italic gui=italic")
-- vim.cmd("highlight! TSUnderline term=underline cterm=underline gui=underline")
-- vim.cmd("highlight! link TSTitle Title")
-- vim.cmd("highlight! link TSLiteral String")
-- vim.cmd("highlight! link TSURI Underlined")

-- vim.cmd("highlight! link TSTag Label")
-- vim.cmd("highlight! link TSTagDelimiter Delimiter")
