return {
  "luukvbaal/statuscol.nvim",
  opts = { setopt = true },
  config = function(_, opts)
    require("statuscol").setup(opts)
  end,
}
