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
vim.opt.pyxversion = 3

--------------------------------- The Basics ----------------------------------
vim.g.mapleader = " "

vim.opt.clipboard = "unnamed" -- yank to system clipboard
vim.opt.commentstring = "# %s"
vim.opt.hidden = true -- switch buffers without saving
vim.opt.mouse = "a" -- let the mouse wheel scroll page, etc
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ttimeout = true -- prevent delay when changing modes
vim.opt.ttimeoutlen = 50
vim.opt.updatetime = 100 -- speed up screen updating
vim.opt.undofile = true -- persistent undo
vim.opt.viewoptions:remove({ "options" }) -- keep from saving cur dir in view

if vim.fn.executable("fish") then
  vim.opt.shell = "fish"
end

----------------------------- Tabs & Indentation ------------------------------
vim.opt.cindent = false
vim.opt.expandtab = true -- tabs insert spaces
vim.opt.foldlevel = 99
vim.opt.joinspaces = false -- only one space after punction when joining lines
vim.opt.linebreak = true -- wrap line if too long
vim.opt.list = true -- show listchars
vim.opt.listchars = {
  extends = "",
  precedes = "",
  nbsp = "·",
  tab = " ",
  trail = "·",
}
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

---------------------------------- Searching ----------------------------------
vim.opt.ignorecase = true
vim.opt.path:append({ "**" }) -- add current file location to path
vim.opt.smartcase = true
vim.opt.wildignore:append({
  "*/tmp/*",
  "/var/*",
  "*.so",
  "*.swp",
  "*.zip",
  "*.tar",
  "*.pyc",
})
vim.opt.wildmode = { "longest:full", "full" }

-- use rg instead of grep if available
if vim.fn.executable("rg") then
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end

--------------------------------- Appearance ----------------------------------
vim.env.NVIM_TERM = 1 -- TODO: Why?

vim.opt.background = "dark"
vim.opt.cursorline = true -- highlight the line the cursor is on
vim.opt.number = true
vim.opt.scrolloff = 1 -- start scrolling when near the last line
vim.opt.showmode = false
vim.opt.sidescrolloff = 5 -- start scrolling when near the last col
vim.opt.termguicolors = true -- true color support

--------------------------------- Completion ----------------------------------
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.shortmess:append("c")

-------------------------------------------------------------------------------
--                                  Mappings                                 --
-------------------------------------------------------------------------------
local map = require("tb.utils").map

---------------------------------- Navigation ---------------------------------
map("i", "jj", "<Esc>", { noremap = false }) -- exit insert (-noremap for abbrevs)
map("t", "kk", "<C-\\><C-n>", { noremap = false }) -- exit terminal mode
map("nx", ";", ":", { silent = false }) -- faster command entry
map("n", "H", "^") -- beginning of line
map("n", "L", "$") -- end of line

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

---------------------------------- Filetype -----------------------------------
vim.g.did_load_filetypes = 0 -- don't use filetype.vim
vim.g.do_filetype_lua = 1 -- use filetype.lua

----------------------------------- Plugins -----------------------------------
vim.g.loaded_netrwPlugin = 1 -- no netrw
vim.g.netrw_dirhistmax = 0 -- no netrwhist

require("plugins")
-- require("minimal")
