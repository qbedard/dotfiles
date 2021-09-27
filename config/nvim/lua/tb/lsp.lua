local lspconfig = require("lspconfig")

------------------------------------ Signs -------------------------------------
local i = require("tb.icons")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    update_in_insert = false,
    virtual_text = { prefix = i.diag.virtual },
  }
)

vim.fn.sign_define("LspDiagnosticsSignError", {
  text = i.diag.error,
  texthl = "LspDiagnosticsSignError",
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
  text = i.diag.warn,
  texthl = "LspDiagnosticsSignWarning",
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
  text = i.diag.info,
  texthl = "LspDiagnosticsSignInformation",
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
  text = i.diag.hint,
  texthl = "LspDiagnosticsSignHint",
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
capabilities.textDocument.completion.snippetSupport = false

-------------------------------- Simple Configs --------------------------------
local servers = {
  "bashls",
  -- "ccls",
  -- "clangd",
  -- "cmake",
  "cssls",
  "dockerls",
  "gopls",
  "html",
  -- "jsonls",
  "rnix",
  "rust_analyzer",
  "sqls",
  -- "taplo",
  -- "solargraph", -- ruby
  -- "terraformls",
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({ capabilities = capabilities })
end

require("lspconfig").taplo.setup({
  settings = {
    evenBetterToml = {
      formatter = {
        alignEntries = true,
        indentTables = true,
        reorderKeys = true,
      },
    },
  },
})

--------------------- General Lint/Format (efm-langserver) ---------------------
local efm_prettier = {
  formatCommand = "prettier --stdin-filepath '${INPUT}'",
  formatStdin = true,
}

local efm_sqlformat = {
  -- TODO: Find something that works better
  formatCommand = "sqlformat -k upper --wrap_after 80 -",
  formatStdin = true,
}

lspconfig.efm.setup({
  capabilities = capabilities,
  cmd = {
    "efm-langserver",
    "-logfile",
    vim.fn.stdpath("cache") .. "/efm.log",
    "-loglevel",
    "5",
  },
  init_options = { codeAction = false, documentFormatting = true },
  filetypes = {
    "css",
    "fish",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "lua",
    "markdown",
    "mysql",
    "python",
    "ruby",
    "sh",
    "sql",
    "terraform",
    -- "toml",
    "yaml",
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      css = { efm_prettier },
      fish = {
        { formatCommand = "fish_indent", formatStdin = true },
        {
          lintCommand = "fish -n '${INPUT}'",
          lintFormats = {
            "%f (line %l): %m",
          },
        },
      },
      html = { efm_prettier },
      javascript = { efm_prettier },
      javascriptreact = { efm_prettier },
      json = { efm_prettier },
      lua = {
        -- {
        --   formatCommand = "lua-format -i",
        --   formatStdin = true,
        -- },
        -- {
        --   formatCommand = "luafmt --indent-count 2 --line-width 88 --stdin",
        --   formatStdin = true,
        -- },
        {
          formatCommand = "stylua -s --stdin-filepath '${INPUT}' -",
          formatStdin = true,
        },
      },
      markdown = { efm_prettier },
      mysql = { efm_sqlformat },
      python = {
        { formatCommand = "black --quiet -", formatStdin = true },
        {
          lintCommand = "flake8 --format 'W %(path)s:%(row)d:%(col)d: %(code)s %(text)s' --stdin-display-name '${INPUT}' -",
          lintStdin = true,
          lintFormats = {
            "%t %f:%l:%c: %m",
          },
        },
        { formatCommand = "isort --quiet -", formatStdin = true },
      },
      ruby = {
        {
          formatCommand = "rubocop --fix-layout --force-exclusion --stderr --stdin '${INPUT}'",
          formatStdin = true,
        },
        {
          lintCommand = "rubocop --format clang --no-display-cop-names --stdin '${INPUT}'",
          lintFormats = {
            "%f:%l:%c: %t: %m",
          },
          lintStdin = true,
        },
      },
      sh = {
        {
          lintCommand = "shellcheck -f gcc -x",
          lintFormats = {
            "%f:%l:%c: %trror: %m",
            "%f:%l:%c: %tarning: %m",
            "%f:%l:%c: %tote: %m",
          },
        },
        {
          formatCommand = "shfmt -bn -ci -i 2 -s",
          formatStdin = true,
        },
      },
      sql = { efm_sqlformat },
      -- TODO: Get this working.
      terraform = {
        { formatCommand = "terraform fmt -", formatStdin = true },
      },
      -- toml = { efm_prettier },
      yaml = { efm_prettier },
      ["yaml.docker-compose"] = { efm_prettier },
    },
  },
})

------------------------------------ Python ------------------------------------
local python = "python"
if vim.env.VIRTUAL_ENV then
  python = vim.env.VIRTUAL_ENV .. "/bin/python"
end
lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      -- analysis = {
      --   diagnosticSeverityOverrides = {
      --     reportMissingTypeStubs = true,
      --     reportUnknownArgumentType = "warning",
      --     reportUnknownLambdaType = "warning",
      --     reportUnknownMemberType = "warning",
      --     reportUnknownParameterType = "warning",
      --     reportUnknownVariableType = "warning",
      --   },
      --   typeCheckingMode = "strict",
      -- },
      pythonPath = python,
    },
  },
})

------------------------------------- SQL --------------------------------------
-- TODO: Figure out why this doesn't work.
-- lspconfig.sqls.setup({
--   capabilities = capabilities,
--   settings = {
--     sqls = {
--       connections = {
--         {
--           alias = "mysql",
--           driver = "mysql",
--           dataSourceName = "root:root@tcp(127.0.0.1:3306)/customerportal",
--         },
--       },
--     },
--   },
-- })

------------------------------------- Lua --------------------------------------
local sumneko_root_path = vim.fn.stdpath("data")
  .. "/site/pack/packer/start/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"
lspconfig.sumneko_lua.setup({
  capabilities = capabilities,
  -- TODO: Make work on Linux as well
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      completion = { kewordSnippet = "Disable" },
      diagnostics = {
        enable = true,
        globals = { "hs", "renoise", "spoon", "use", "use_rocks", "vim" },
      },
      runtime = {
        version = "LuaJIT",
        path = { "?.lua", "?/init.lua" },
      },
      telemetry = { enable = false },
      workspace = {
        checkThirdParty = false,
        library = vim.list_extend(
          { "/Applications/Hammerspoon.app/Contents/Resources/extensions/hs" },
          vim.api.nvim_get_runtime_file("lua/", true)
        ),
        maxPreload = 10000,
        preloadFileSize = 10000,
      },
    },
  },
})

---------------------------------- JavaScript ----------------------------------
-- lspconfig.tsserver.setup({
--   capabilities = capabilities,
--   on_attach = function(client)
--     client.resolved_capabilities.document_formatting = false
--   end,
-- })

---------------------------------- Vimscript -----------------------------------
lspconfig.vimls.setup({
  capabilities = capabilities,
  init_options = {
    runtimepath = vim.api.nvim_get_option("runtimepath"),
    indexes = { gap = 75, count = 5 },
  },
})

------------------------------------- YAML -------------------------------------
-- lspconfig.yamlls.setup({
--   capabilities = capabilities,
--   settings = {
--     yaml = {
--       customTags = {
--         "!And",
--         "!Base64",
--         "!Cidr",
--         "!Equals sequence",
--         "!FindInMap sequence",
--         "!GetAZs",
--         "!GetAtt",
--         "!If sequence",
--         "!ImportValue",
--         "!Join sequence",
--         "!Not",
--         "!Or",
--         "!Ref",
--         "!Select",
--         "!Split",
--         "!Sub",
--         "!fn",
--       },
--       format = { enable = true, singleQuote = true },
--       schemaStore = { enable = true },
--       schemas = {
--         -- ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/sam.schema.json"] = "*api*/template.y*ml"
--         ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.y*ml",
--         ["https://json.schemastore.org/eslintrc"] = "*eslintc*",
--         ["https://json.schemastore.org/github-workflow"] = "*.github/workflows/*",
--         ["https://json.schemastore.org/jekyll"] = "_config.y*ml",
--         ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/master/schemas/v3.0/schema.json"] = "openapi.y*ml",
--         ["https://json.schemastore.org/pre-commit-config"] = ".pre-commit-config.y*ml",
--       },
--       validate = true,
--     },
--   },
-- })
