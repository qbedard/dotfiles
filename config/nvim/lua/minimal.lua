local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  })
  vim.cmd("packadd packer.nvim")
end

return require("packer").startup({
  function()
    use({ "wbthomason/packer.nvim" })
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = "maintained",
          highlight = { enable = true },
        })
      end,
    })
    use({
      "npxbr/gruvbox.nvim",
      requires = "rktjmp/lush.nvim",
      config = function()
        vim.g.gruvbox_sign_column = "bg0"
        vim.cmd("colorscheme gruvbox")
        vim.cmd("highlight! link Operator GruvboxRed")
        vim.cmd("highlight! link Function GruvboxAqua")
        vim.cmd("highlight! link Method GruvboxAqua")
        vim.cmd("highlight! link TSConstBuiltin Constant")
        vim.cmd("highlight! clear TSError")
        vim.cmd("highlight! link DiffChange GruvboxBlue")
      end,
    })
    use("sumneko/lua-language-server")
    use("tpope/vim-commentary")
    use("tpope/vim-surround")
  end,
})
