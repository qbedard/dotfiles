return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
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
}
