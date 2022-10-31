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
          ensure_installed = "all",
          highlight = { enable = true, disable = { "scss" } },
        })
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      end,
    })
    use({
      "echasnovski/mini.nvim",
      config = function()
        require("mini.comment").setup({})
        require("mini.surround").setup({})
      end,
    })
    use({
      "ellisonleao/gruvbox.nvim",
      config = function()
        require("gruvbox").setup({
          overrides = {
            -- general
            Function = { link = "GruvboxAqua" },
            Method = { link = "GruvboxAqua" },
            Operator = { link = "GruvboxRed" },
            SignColumn = { link = "GruvboxBg0" },
            GruvboxAquaSign = { bg = "#282828" },
            GruvboxBlueSign = { bg = "#282828" },
            GruvboxGreenSign = { bg = "#282828" },
            GruvboxOrangeSign = { bg = "#282828" },
            GruvboxPurpleSign = { bg = "#282828" },
            GruvboxRedSign = { bg = "#282828" },
            GruvboxYellowSign = { bg = "#282828" },
            NormalFloat = { link = "Float" },
            -- gitsigns
            GitSignsChange = { link = "GruvboxBlueSign" },
            -- treesitter
            ["@constant.builtin"] = { link = "Constant" },
          },
        })
        vim.cmd("colorscheme gruvbox")
        vim.cmd("hi clear Error") -- fix some ugly in floats
      end,
    })

    -- Insert plugins to test here. --

    if packer_bootstrap then
      require("packer").sync()
    end
  end,
})
