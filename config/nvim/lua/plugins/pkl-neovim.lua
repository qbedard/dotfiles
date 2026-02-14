return {
  "apple/pkl-neovim",
  ft = "pkl",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    vim.g.pkl_neovim = { start_command = { "pkl-lsp" }, pkl_cli_path = "pkl" }
  end,
}
