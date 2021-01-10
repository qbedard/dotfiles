require("packer").startup {
  function()
    use "wbthomason/packer.nvim"
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = "all",
          highlight = {enable = true}
        }
      end
    }
    use {
      "gruvbox-community/gruvbox",
      config = function()
        vim.g.gruvbox_italic = 1
        vim.g.gruvbox_sign_column = "bg0"
        vim.cmd("colorscheme gruvbox")
        vim.cmd("highlight clear FoldColumn")
        vim.cmd("highlight! link FoldColumn LineNr")
        vim.cmd("highlight! link TSConstBuiltin Constant")
        vim.cmd("highlight! link TSKeywordOperator Keyword")
        vim.cmd("highlight! link TSOperator GruvboxRed")
        vim.cmd("highlight! link TSFunction GruvboxAqua")
        vim.cmd("highlight! link TSMethod GruvboxAqua")
      end
    }
    use "sumneko/lua-language-server"
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
  end
}
