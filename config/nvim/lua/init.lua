require'plugins'

require'lsp'
require'treesitter'

-- vim.g.gruvbox_italic = 1
-- vim.g.gruvbox_sign_column = 'bg0'

-- vim.cmd('colorscheme gruvbox')  -- must come after gruvbox_italic

-- -- match the fold column colors to the line number column
-- -- must come after colorscheme gruvbox
-- vim.cmd('highlight clear FoldColumn')
-- vim.cmd('highlight! link FoldColumn LineNr')

local M = {}
function M.setup_nvim_lsp() end
function M.setup_nvim_treesitter() end
return M
