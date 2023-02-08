return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- "autoflake",
        -- "bandit",
        "black",
        -- "docformatter",
        -- "flake8",
        -- "flake8-bugbear",
        "isort",
        -- "pep8-naming",
        "prettier",
        -- "pydocstyle",
        "ruff",
        "sql-formatter",
        -- "sqlfluff",  -- available, but not using currently
        -- "sqlparse",  -- not available, but not using currently
        "vint",
      },
    },
  },
  opts = { ui = { border = "rounded" } },
}
