local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local h = require("null-ls.helpers")

local diagnostics_flake8 = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "python" },
  generator = null_ls.generator({
    command = "flake8",
    args = {
      "--format=default",
      "--select=C,E,F,W,B,N,B950",
      "--ignore=E203,E501,N818,W503",
      "--stdin-display-name=$FILENAME",
      "-",
    },
    to_stdin = true,
    from_stderr = true,
    format = "line",
    check_exit_code = function(code)
      return code == 0 or code == 255
    end,
    on_output = h.diagnostics.from_pattern(
      [[:(%d+):(%d+): ((%u)%w+) (.*)]],
      { "row", "col", "code", "severity", "message" },
      {
        severities = {
          E = h.diagnostics.severities["error"],
          B = h.diagnostics.severities["warning"],
          C = h.diagnostics.severities["warning"],
          W = h.diagnostics.severities["warning"],
          D = h.diagnostics.severities["information"],
          F = h.diagnostics.severities["information"],
          N = h.diagnostics.severities["information"],
        },
      }
    ),
  }),
  factory = h.generator_factory,
}

require("null-ls").setup({
  sources = {
    code_actions.gitsigns,
    diagnostics.fish,
    -- diagnostics.flake8,
    diagnostics_flake8,
    -- diagnostics.mypy,
    -- diagnostics.rubocop,
    diagnostics.shellcheck,
    -- formatting.black,
    formatting.black.with({ extra_args = { "--preview" } }),
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
    formatting.sqlformat,
    formatting.stylua,
    formatting.terraform_fmt,
  },
})
