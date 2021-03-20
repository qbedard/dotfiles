-------------------------------------------------------------------------------
--   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   --
--                          Tim Bedard's Vim Config                          --
--   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   --
-------------------------------------------------------------------------------

--     "Make for yourself a definition or description of the thing which is
--   presented to you, so as to see distinctly what kind of a thing it is in
--  its substance, in its nudity, in its complete entirety, and tell yourself
--      its proper name, and the names of the things of which it has been
--      compounded, and into which it will be resolved. For nothing is so
--  productive of elevation of mind as to be able to examine methodically and
--   truly every object that is presented to you in life, and always to look
--    at things so as to see at the same time what kind of universe this is,
--  and what kind of use everything performs in it, and what value everything
--                      has with reference to the whole."

--                             - Marcus Aurelius, Meditations, iii. 11.

-------------------------------------------------------------------------------
--                                  General                                  --
-------------------------------------------------------------------------------
----------------------------------- Python ------------------------------------
vim.o.pyxversion = 3

--------------------------------- The Basics ----------------------------------
vim.bo.undofile = true -- persistent undo
vim.cmd("set completeopt-=preview") -- preview in a buffer?! No.
vim.cmd("set viewoptions-=options") -- keep from saving cur dir in view
vim.g.mapleader = " "
vim.o.clipboard = "unnamed" -- yank to system clipboard
vim.o.hidden = true -- switch buffers without saving
vim.o.mouse = "a" -- let the mouse wheel scroll page, etc
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ttimeout = true -- prevent delay when changing modes
vim.o.ttimeoutlen = 50
vim.o.updatetime = 100 -- speed up screen updating

if vim.fn.executable("fish") then
  vim.o.shell = "fish"
end

----------------------------- Tabs & Indentation ------------------------------
vim.bo.expandtab = true -- tabs insert spaces
vim.bo.smartindent = true
vim.o.joinspaces = false -- only insert one space after punction when joining lines
vim.o.listchars = "tab:→ ,extends:›,precedes:‹,nbsp:·,trail:·"
vim.wo.foldlevel = 99
vim.wo.linebreak = true -- wrap line if too long
vim.wo.list = true -- show listchars

---------------------------------- Searching ----------------------------------
vim.cmd("set path+=**") -- add current file location to path
vim.cmd("set wildignore+=*/tmp/*,/var/*,*.so,*.swp,*.zip,*.tar,*.pyc")
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildmode = "longest:full,full"

-- use rg instead of grep if available
if vim.fn.executable("rg") then
  vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
end

--------------------------------- Appearance ----------------------------------
vim.env.NVIM_TERM = 1 -- TODO: Why?
vim.o.background = "dark"
vim.o.scrolloff = 1 -- start scrolling when near the last line
vim.o.showmode = false
vim.o.sidescrolloff = 5 -- start scrolling when near the last col
vim.o.termguicolors = true -- true color support
vim.wo.cursorline = true -- highlight the line the cursor is on
vim.wo.number = true
-- vim.wo.relativenumber = true

--------------------------------- Completion ----------------------------------
vim.cmd("set shortmess+=c")
vim.o.completeopt = "menuone,noinsert,noselect"

----------------------------------- Plugins -----------------------------------
-- Go away, netrw!
vim.g.netrw_dirhistmax = 0 -- no netrwhist
-- vim.api.nvim_exec(
--   [[
--     augroup hide_netrw
--       autocmd FileType netrw setl bufhidden=wipe
--     augroup END
--   ]],
--   false
-- )

require("plugins")
