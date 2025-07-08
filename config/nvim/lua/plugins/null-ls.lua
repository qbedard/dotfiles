return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mason-org/mason.nvim",
  },
  opts = function()
    local null_ls = require("null-ls")
    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting

    -- local ruff_args = {
    --   "--select=A,B,C4,C90,D,E,F,I,N,PIE,PT003,PT006,PT008,PT022,RET504,SIM,T20,UP,W",
    --   "--ignore=D1,D203,D205,D213,D400,D415",
    -- }

    return {
      debug = true,
      sources = {
        code_actions.gitsigns,
        code_actions.regal,
        -- TODO: Get working
        -- diagnostics.bandit.with({
        --   runtime_condition = function(utils)
        --     if string.find(utils.bufname, "tests") then
        --       return false
        --     else
        --       return true
        --     end
        --   end,
        -- }),
        diagnostics.actionlint,
        diagnostics.fish,
        -- diagnostics.rubocop,
        -- diagnostics.ruff.with({ extra_args = ruff_args }),
        -- diagnostics.selene,
        -- diagnostics.shellcheck,
        -- diagnostics.sqlfluff.with({
        --   extra_args = { "--dialect", "mysql" },
        --   filetypes = { "mysql", "sql" },
        -- }),

        formatting.fish_indent,
        formatting.prettier,
        -- formatting.rubocop,
        -- formatting.ruff.with({ extra_args = ruff_args }),
        formatting.shfmt,
        -- formatting.sqlfluff.with({
        --   extra_args = { "--dialect", "mysql" },
        --   filetypes = { "mysql", "sql" },
        -- }),
        -- formatting.sqlformat,
        formatting.sql_formatter.with({
          extra_args = { "-l", "mysql", "-c", vim.env.HOME .. "/.sql-formatter.json" },
          filetypes = { "mysql", "sql" },
        }),
        formatting.stylua,
        formatting.terraform_fmt,
      },
    }
  end,
}
