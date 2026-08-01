return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-treesitter").install({ "stable", "unstable" })
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end,
  },
  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.comment").setup({})
      require("mini.surround").setup({})
    end,
  },
  {
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
  },
  -- Insert plugins to test here. --
}
