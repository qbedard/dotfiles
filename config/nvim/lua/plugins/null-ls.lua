return {
  -- "jose-elias-alvarez/null-ls.nvim",
  "timbedard/null-ls.nvim",
  branch = "more-python-tools",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
    {
      "jay-babu/mason-null-ls.nvim",
      config = {
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
  config = function()
    local null_ls = require("null-ls")
    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting

    require("null-ls").setup({
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
        diagnostics.flake8.with({
          extra_args = { "--select=C,E,F,W,B,N,B950", "--ignore=E203,E501,N818,W503" },
        }),
        -- diagnostics.mypy,
        -- diagnostics.rubocop,
        diagnostics.pydocstyle.with({ extra_args = { "--add-ignore=D1,D205,D400" } }),
        -- diagnostics.selene,
        diagnostics.shellcheck,
        -- diagnostics.sqlfluff.with({
        --   extra_args = { "--dialect", "mysql" },
        --   filetypes = { "mysql", "sql" },
        -- }),
        formatting.autoflake.with({ extra_args = { "--remove-all-unused-imports" } }),
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
  end,
}
