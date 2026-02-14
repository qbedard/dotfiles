return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      fish = { "fish" },
      -- yaml = { "actionlint" }, -- TODO: enable only for actions, not all YAML
    }

    vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
