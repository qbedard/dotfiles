return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- "bandit",
        -- "docformatter",
        "prettier",
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
