local function gh(repo)
  return "https://github.com/" .. repo
end

-- Globals read by plugins when their `plugin/`/`ftplugin/` files are sourced.
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" } -- quick-scope
vim.g.matchup_matchparen_offscreen = {} -- vim-matchup
vim.g.pkl_neovim = { start_command = { "pkl-lsp" }, pkl_cli_path = "pkl" }

vim.pack.add({
  -- colorscheme first so its highlight groups exist for everything else
  gh("ellisonleao/gruvbox.nvim"),
  -- shared libraries / providers
  gh("nvim-mini/mini.nvim"),
  gh("nvim-treesitter/nvim-treesitter"),
  gh("nvim-treesitter/nvim-treesitter-textobjects"),
  -- completion + LSP
  { src = gh("saghen/blink.cmp"), version = vim.version.range("1") },
  gh("folke/lazydev.nvim"),
  gh("mason-org/mason.nvim"),
  gh("neovim/nvim-lspconfig"),
  gh("mason-org/mason-lspconfig.nvim"),
  -- editing / UI
  gh("folke/snacks.nvim"),
  gh("stevearc/conform.nvim"),
  gh("lewis6991/gitsigns.nvim"),
  gh("mfussenegger/nvim-lint"),
  gh("akinsho/bufferline.nvim"),
  gh("nvim-lualine/lualine.nvim"),
  gh("folke/trouble.nvim"),
  gh("windwp/nvim-ts-autotag"),
  gh("Wansmer/treesj"),
  gh("catgoose/nvim-colorizer.lua"),
  gh("zbirenbaum/copilot.lua"),
  gh("j-hui/fidget.nvim"),
  -- language support
  gh("apple/pkl-neovim"),
  gh("sophacles/vim-bundle-mako"),
  gh("Glench/Vim-Jinja2-Syntax"),
  gh("vim-test/vim-test"),
  -- vimscript utilities (no configuration needed)
  gh("tpope/vim-fugitive"),
  gh("tpope/vim-rhubarb"),
  gh("tpope/vim-abolish"),
  gh("tpope/vim-eunuch"),
  gh("unblevable/quick-scope"),
  gh("andymass/vim-matchup"),
  gh("kshenoy/vim-signature"),
  gh("romainl/vim-cool"),
  gh("farmergreg/vim-lastplace"),
  gh("michaeljsmith/vim-indent-object"),
}, { confirm = false })

-- Load each plugin's config module. The order is explicit (not a directory
-- scan) because it matters: gruvbox's highlights and mini's icon provider must
-- be set up before the UI plugins that reference them.
for _, mod in ipairs({
  "gruvbox", -- colorscheme; others link its highlight groups
  "mini", -- icon provider for statusline/bufferline/trouble
  "snacks",
  "treesitter", -- required by treesj and pkl-neovim
  "blink-cmp", -- LSP capabilities source, required by lspconfig
  "lspconfig", -- lazydev/mason -> nvim-lspconfig -> mason-lspconfig
  "conform",
  "gitsigns",
  "lint",
  "bufferline",
  "lualine",
  "trouble",
  "treesj",
}) do
  require("plugins." .. mod)
end

-- Trivial setups that don't warrant their own config file.
require("fidget").setup({ notification = { override_vim_notify = false } })
require("colorizer").setup({
  filetypes = { "css", "scss", "html" },
  user_default_options = { mode = "virtualtext" },
})
require("copilot").setup({
  suggestion = {
    auto_trigger = true,
    keymap = { accept = false },
  },
})
