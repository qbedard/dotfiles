return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["*"] = { "trim_newlines", "trim_whitespace" },
      fish = { "fish_indent" },
      hcl = { "hcl" },
      -- javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
      json = { "biome", "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      mysql = { "sql_formatter" },
      python = { "ruff_organize_imports", "ruff_fix", "ruff" },
      rego = { "opa_fmt" },
      sh = { "shfmt" },
      sql = { "sql_formatter" },
      terraform = { "terraform_fmt" },
      -- typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
