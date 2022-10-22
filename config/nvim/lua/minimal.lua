local ensure_packer = function()
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
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup({
  function(use)
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
      "ellisonleao/gruvbox.nvim",
      config = function()
        vim.g.gruvbox_sign_column = "bg0"
        vim.cmd("colorscheme gruvbox")
        vim.cmd("highlight! link Operator GruvboxRed")
        vim.cmd("highlight! link Function GruvboxAqua")
        vim.cmd("highlight! link Method GruvboxAqua")
        vim.cmd("highlight! link TSOperator GruvboxRed")
        vim.cmd("highlight! link TSFunction GruvboxAqua")
        vim.cmd("highlight! link TSMethod GruvboxAqua")
        vim.cmd("highlight! link TSConstBuiltin Constant")
        vim.cmd("highlight! link DiffChange GruvboxBlue")
      end,
    })
    use("tpope/vim-commentary")
    use("tpope/vim-surround")

    -- Insert plugins to test here. --

    if packer_bootstrap then
      require("packer").sync()
    end
  end,
})
