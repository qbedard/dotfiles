local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

require("null-ls").setup({
  debug = true,
  sources = {
    code_actions.gitsigns,
    diagnostics.bandit,
    diagnostics.fish,
    diagnostics.flake8,
    -- diagnostics.mypy,
    -- diagnostics.rubocop,
    diagnostics.pydocstyle.with({ extra_args = { "--add-ignore=D1" } }),
    diagnostics.shellcheck,
    -- diagnostics.sqlfluff.with({
    --   extra_args = { "--dialect", "mysql" },
    --   filetypes = { "mysql", "sql" },
    -- }),
    formatting.autoflake.with({ extra_args = { "--remove-all-unused-imports" } }),
    formatting.black.with({ extra_args = { "--preview" } }),
    formatting.docformatter.with({
      extra_args = {
        "--pre-summary-newline", -- compatibility for now
        "--wrap-summaries=88",
        "--wrap-descriptions=88",
      },
    }),
    formatting.fish_indent,
    formatting.isort.with({
      args = {
        "--stdout",
        "--profile=black",
        "--filename=$FILENAME",
        "-",
      },
    }),
    formatting.prettier,
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
})
