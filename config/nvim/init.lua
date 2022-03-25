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

---------------------------------- Filetype -----------------------------------
vim.g.did_load_filetypes = 0 -- don't use filetype.vim
vim.g.do_filetype_lua = 1 -- use filetype.lua

vim.filetype.add({
  extension = {
    conf = "cfg",
    dockerfile = "dockerfile",
    keymap = "c",
    overlay = "c",
    sql = "mysql",
  },
  filename = {
    Brewfile = "ruby",
    direnvrc = "bash",
    ["poetry.lock"] = "toml",
  },
})

----------------------------------- Python ------------------------------------
vim.opt.pyxversion = 3

-------------------------------------------------------------------------------
--                                  Mappings                                 --
-------------------------------------------------------------------------------
---------------------------------- Navigation ---------------------------------
vim.keymap.set("i", "jj", "<Esc>") -- exit insert
vim.keymap.set("t", "kk", "<C-\\><C-n>") -- exit terminal mode
vim.keymap.set({ "n", "x" }, ";", ":") -- faster command entry
vim.keymap.set("n", "H", "^") -- beginning of line
vim.keymap.set("n", "L", "$") -- end of line

----------------------------------- Editing -----------------------------------
vim.keymap.set("n", "U", "<C-R>") -- redo
vim.keymap.set("i", "<C-u>", "<C-g>u<C-u>") -- allow undo of <C-u>
vim.keymap.set("i", "<C-w>", "<C-g>u<C-w>") -- allow undo of <C-w>
-- TODO: make repeatable
vim.keymap.set("n", "<leader>i", "i<Space><Esc>r") -- insert single character before
vim.keymap.set("n", "<leader>a", "a<Space><Esc>r") -- insert single character after

--- some brilliant line movement mappings from junegunn ---
vim.keymap.set("n", "<M-k>", ":move-2<CR>", { silent = true }) -- move line up
vim.keymap.set("n", "<M-j>", ":move+<CR>", { silent = true }) -- move line down
vim.keymap.set("n", "<M-l>", ">>", { silent = true }) -- indent line
vim.keymap.set("n", "<M-h>", "<<", { silent = true }) -- outdent line
vim.keymap.set("x", "<M-k>", ":move-2<CR>gv", { silent = true }) -- move selection up
vim.keymap.set("x", "<M-j>", ":move'>+<CR>gv", { silent = true }) -- move selection up
vim.keymap.set("x", "<M-l>", ">gv", { silent = true }) -- indent selection
vim.keymap.set("x", "<M-h>", "<gv", { silent = true }) -- outdent selection
vim.keymap.set("x", ">", ">gv", { silent = true }) -- indent selection
vim.keymap.set("x", "<", "<gv", { silent = true }) -- outdent selection

-------------------------------------------------------------------------------
--                                Autocommands                               --
-------------------------------------------------------------------------------
local recompile_plugins = vim.api.nvim_create_augroup("recompile_plugins", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = recompile_plugins,
  pattern = "plugins.lua",
  callback = function()
    require("packer").compile()
  end,
})

local number_toggle = vim.api.nvim_create_augroup("number_toggle", {})
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
  group = number_toggle,
  callback = function()
    vim.wo.relativenumber = true
  end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
  group = number_toggle,
  callback = function()
    vim.wo.relativenumber = false
  end,
})

-- " TODO: Find out why tf I do this
-- augroup win_resize
--   autocmd!
--   autocmd VimResized * wincmd =
-- augroup END

-- " Go away, netrw!
-- augroup hide_netrw
--   autocmd!
--   autocmd FileType netrw setl bufhidden=wipe
-- augroup END

-------------------------------------------------------------------------------
--                                  Commands                                 --
-------------------------------------------------------------------------------
local command = vim.api.nvim_add_user_command

-- Sometimes I'm bad at typing.
command("Q", "q", { bang = true })
command("W", "w", { bang = true })
command("WQ", "wq", { bang = true })
command("Wq", "wq", { bang = true })

-------------------------------------------------------------------------------
--                                  Plugins                                  --
-------------------------------------------------------------------------------
vim.g.loaded_netrwPlugin = 1 -- no netrw
vim.g.netrw_dirhistmax = 0 -- no netrwhist

require("plugins")
-- require("minimal")
