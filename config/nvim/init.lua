-------------------------------------------------------------------------------
--   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   --
--                        Tim Bedard's Neovim Config                         --
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
vim.opt.mouse = "a" -- let the mouse wheel scroll page, etc
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ttimeout = true -- prevent delay when changing modes
vim.opt.updatetime = 100 -- speed up screen updating
vim.opt.undofile = true -- persistent undo

if vim.fn.executable("fish") then
  vim.opt.shell = "fish"
end

----------------------------- Tabs & Indentation ------------------------------
-- vim.opt.breakindent = true -- TODO: figure out breaking cursorline highlight
vim.opt.cindent = false
vim.opt.expandtab = true -- tabs insert spaces
vim.opt.fillchars = {
  horiz = "─",
  horizup = "┴",
  horizdown = "┬",
  vert = "│",
  vertleft = "┤",
  vertright = "├",
  verthoriz = "┼",
  eob = " ", -- replace "~" at end buffer
}
vim.opt.foldlevel = 99
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
vim.opt.virtualedit = "block"

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
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "Constant" })

vim.env.NVIM_TERM = 1 -- TODO: Why?

vim.opt.colorcolumn = "80"
vim.opt.cursorline = true -- highlight the line the cursor is on
vim.opt.number = true
vim.opt.pumblend = 10 -- transparent popup menu
vim.opt.scrolloff = 1 -- start scrolling when near the last line
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.sidescrolloff = 5 -- start scrolling when near the last col
vim.opt.termguicolors = true -- true color support
vim.opt.winblend = 10 -- transparent floating windows

--------------------------------- Completion ----------------------------------
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.shortmess:append("c")

---------------------------------- Filetype -----------------------------------
vim.filetype.add({
  extension = {
    conf = "cfg",
    dockerfile = "dockerfile",
    keymap = "c",
    jsonl = "json",
    overlay = "c",
    sql = "mysql",
    tfstate = "json",
    tfvars = "hcl",
  },
  filename = {
    [".flake8"] = "cfg",
    Brewfile = "ruby",
    direnvrc = "bash",
    flake8 = "cfg",
    ["poetry.lock"] = "toml",
  },
  pattern = {
    [".*git/config"] = "gitconfig",
    [".*gitconfig.*"] = "gitconfig",
  },
})

----------------------------------- Python ------------------------------------
vim.opt.pyxversion = 3

-------------------------------------------------------------------------------
--                                  Mappings                                 --
-------------------------------------------------------------------------------
local map = vim.keymap.set
---------------------------------- Navigation ---------------------------------
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
map("t", "kk", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map({ "n", "x" }, ";", ":", { desc = "Enter command mode" })
map({ "n", "x" }, "J", "<Cmd>bprev<CR>", { desc = "Previous buffer" })
map({ "n", "x" }, "K", "<Cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "H", "^", { desc = "Go to line's first non-blank character" })
map("n", "L", "$", { desc = "Go to end of line" })

map("x", "il", "^og_", { desc = "Inside line" })
map("o", "il", ":normal vil<CR>", { desc = "Inside line" })

----------------------------------- Editing -----------------------------------
map("n", "U", "<C-R>", { desc = "Redo" })
map("i", "<C-u>", "<C-g>u<C-u>", { desc = "Undo" }) -- allow undo of <C-u>
map("i", "<C-w>", "<C-g>u<C-w>", { desc = "Undo" }) -- allow undo of <C-w>
-- TODO: make repeatable
map("n", "<Leader>i", "i<Space><Esc>r", { desc = "Insert single character before" })
map("n", "<Leader>a", "a<Space><Esc>r", { desc = "Insert single character after" })
map(
  "n",
  "gO",
  "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>",
  { desc = "Put empty line above" }
)
map(
  "n",
  "go",
  "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>",
  { desc = "Put empty line below" }
)

--- some brilliant line movement mappings from junegunn ---
map("n", "<M-k>", ":move-2<CR>", { desc = "Move line up", silent = true })
map("n", "<M-j>", ":move+<CR>", { desc = "Move line down", silent = true })
map("n", "<M-l>", ">>", { desc = "Indent line", silent = true })
map("n", "<M-h>", "<<", { desc = "Outdent line", silent = true })
map("x", "<M-k>", ":move-2<CR>gv", { desc = "Move selection up", silent = true })
map("x", "<M-j>", ":move'>+<CR>gv", { desc = "Move selection down", silent = true })
map("x", "<M-l>", ">gv", { desc = "Indent selection", silent = true })
map("x", "<M-h>", "<gv", { desc = "Outdent selection", silent = true })
map("x", ">", ">gv", { desc = "Indent selection", silent = true })
map("x", "<", "<gv", { desc = "Outdent selection", silent = true })

-------------------------------------------------------------------------------
--                                Autocommands                               --
-------------------------------------------------------------------------------
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

-- fix formatexpr
local lsp_attach = vim.api.nvim_create_augroup("lsp_attach", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_attach,
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil
  end,
})

-------------------------------------------------------------------------------
--                                  Commands                                 --
-------------------------------------------------------------------------------
-- Sometimes I'm bad at typing.
vim.api.nvim_create_user_command("Q", "q", { bang = true })
vim.api.nvim_create_user_command("W", "w", { bang = true })
vim.api.nvim_create_user_command("WQ", "wq", { bang = true })
vim.api.nvim_create_user_command("Wq", "wq", { bang = true })

-------------------------------------------------------------------------------
--                                  Plugins                                  --
-------------------------------------------------------------------------------
vim.g.loaded_netrwPlugin = 1 -- no netrw
vim.g.netrw_dirhistmax = 0 -- no netrwhist

-- Bootstrap lazy.nvim
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path,
  })
end
vim.opt.runtimepath:prepend(lazy_path)

require("lazy").setup("plugins", { ui = { border = "rounded" } })
-- require("minimal")
