return {
  "onsails/lspkind.nvim",
  setup = function()
    require("lspkind").init({ preset = "codicons" })
  end,
}
