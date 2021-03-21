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
vim.o.listchars = "extends:›,precedes:‹,nbsp:·,tab:→ ,trail:·"
-- vim.o.listchars = "eol:↴,extends:›,precedes:‹,nbsp:·,tab:→ ,trail:·"
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

--------------------------------- Completion ----------------------------------
vim.cmd("set shortmess+=c")
vim.o.completeopt = "menuone,noinsert,noselect"

-------------------------------------------------------------------------------
--                                  Mappings                                 --
-------------------------------------------------------------------------------
local map = require("tb.utils").map

---------------------------------- Navigation ---------------------------------
map("i", "jj", "<Esc>", {noremap = false}) -- exit insert mode (-noremap for abbrevs)
map("t", "kk", "<C-\\><C-n>", {noremap = false}) -- exit terminal mode
map("nx", ";", ":") -- faster command entry
map("n", "H", "^") -- beginning of line
map("n", "L", "$") -- end of line
map("nx", "K", ":BufferNext<CR>")
map("nx", "J", ":BufferPrevious<CR>")

----------------------------------- Editing -----------------------------------
map("n", "U", "<C-R>") -- redo
map("i", "<C-u>", "<C-g>u<C-u>") -- allow undo of <C-u>
map("i", "<C-w>", "<C-g>u<C-w>") -- allow undo of <C-w>
-- TODO: make repeatable
map("n", "<leader>i", "i<Space><Esc>r") -- insert single character before
map("n", "<leader>a", "a<Space><Esc>r") -- insert single character after

--- some brilliant line movement mappings from junegunn ---
map("n", "<M-k>", ":move-2<CR>") -- move line up
map("n", "<M-j>", ":move+<CR>") -- move line down
map("n", "<M-l>", ">>") -- indent line
map("n", "<M-h>", "<<") -- outdent line
map("x", "<M-k>", ":move-2<CR>gv") -- move selection up
map("x", "<M-j>", ":move'>+<CR>gv") -- move selection up
map("x", "<M-l>", ">gv") -- indent selection
map("x", "<M-h>", "<gv") -- outdent selection
map("x", ">", ">gv") -- indent selection
map("x", "<", "<gv") -- outdent selection

----------------------------------- Plugins -----------------------------------
vim.g.netrw_dirhistmax = 0 -- no netrwhist

require("plugins")
-- require("minimal")
