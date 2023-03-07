return {
  "jose-elias-alvarez/null-ls.nvim",
  -- "timbedard/null-ls.nvim",
  -- branch = "more-python-tools",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
    {
      "jay-babu/mason-null-ls.nvim",
      opts = {
        automatic_installation = {
          exclude = {
            "bandit", -- not available
            "docformatter", -- not available
            "fish", -- comes with shell
            "fish_indent", -- comes with shell
            "shellcheck", -- brew
            "shfmt", -- brew
            "stylua", -- brew
            "terraform_fmt", -- comes with terraform
          },
        },
      },
    },
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
        diagnostics.fish,
        -- diagnostics.flake8.with({
        --   extra_args = { "--select=C,E,F,W,B,N,B950", "--ignore=E203,E501,N818,W503" },
        -- }),
        -- diagnostics.mypy,
        -- diagnostics.rubocop,
        -- diagnostics.pydocstyle.with({ extra_args = { "--add-ignore=D1,D205,D400" } }),
        -- diagnostics.selene,
        diagnostics.shellcheck,
        -- diagnostics.ruff.with({ extra_args = ruff_args }),
        -- diagnostics.sqlfluff.with({
        --   extra_args = { "--dialect", "mysql" },
        --   filetypes = { "mysql", "sql" },
        -- }),
        -- formatting.autoflake.with({ extra_args = { "--remove-all-unused-imports" } }),
        formatting.black.with({ extra_args = { "--preview" } }),
        -- formatting.docformatter.with({
        --   extra_args = {
        --     "--close-quotes-on-newline", -- not perfect, but okay
        --     "--pre-summary-newline", -- compatibility for now
        --     "--wrap-summaries=80",
        --     "--wrap-descriptions=80",
        --   },
        -- }),
        formatting.fish_indent,
        formatting.isort.with({
          args = {
            "--stdout",
            "--profile=black",
            "--lines-after-imports=2",
            "--filename=$FILENAME",
            "-",
          },
        }),
        formatting.prettier,
        -- formatting.ruff.with({ extra_args = ruff_args }),
        -- formatting.rubocop,
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
