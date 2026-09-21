-- lazydev (Lua/Neovim API completion for config editing)
require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

-- mason must be set up before mason-lspconfig and before servers are enabled,
-- so its shimmed tool paths are on $PATH.
require("mason").setup({
  ui = { border = "rounded" },
  ensure_installed = {
    "actionlint",
    -- "bandit",
    "fish-language-server",
    -- "fish_indent",
    "hclfmt",
    -- "rubocop",
    -- "selene",
    -- "shellcheck",
    -- "sqlfluff",
    "sql_formatter",
    "stylua",
    -- "terraform_fmt",
  },
})

--------------------------------- Mappings ----------------------------------
local map = vim.keymap.set
map("n", "<Leader>d", vim.diagnostic.open_float)
map("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
end)
map("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end)
map("n", "<Leader>q", vim.diagnostic.setloclist)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition)
map("n", "<Leader>D", vim.lsp.buf.type_definition)
map("n", "<Leader>k", vim.lsp.buf.hover)
map("n", "<Leader>s", vim.lsp.buf.signature_help)
map("n", "g0", vim.lsp.buf.document_symbol)
map("n", "gf", function()
  -- vim.lsp.buf.format({ timeout_ms = 4000 })
  require("conform").format({ timeout_ms = 4000 })
end)
map("n", "<Leader>c", vim.lsp.buf.code_action)

---------------------------------- Signs -----------------------------------
local i = require("icons")
local severity = vim.diagnostic.severity

vim.diagnostic.config({
  float = {
    format = function(diagnostic)
      return diagnostic.code
          and string.format("%s %s", diagnostic.code, diagnostic.message)
        or diagnostic.message
    end,
  },
  severity_sort = true,
  signs = {
    text = {
      [severity.ERROR] = i.diag.error,
      [severity.WARN] = i.diag.warn,
      [severity.INFO] = i.diag.info,
      [severity.HINT] = i.diag.hint,
      -- [severity.OK] = i.diag.ok, -- This is gone? Does it matter?
    },
  },
  virtual_text = {
    prefix = i.diag.virtual,
    -- source = "always",
  },
})

-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   opts = opts or {}
--   opts.border = opts.border or "rounded"
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

local capabilities = require("blink.cmp").get_lsp_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
-- capabilities.textDocument.completion.completionItem.snippetSupport = false

------------------------------ Simple Configs ------------------------------
local servers = {
  "bashls",
  "ccls",
  -- "clangd",
  -- "cmake",
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "gdscript",
  "gopls",
  "helm_ls",
  "html",
  -- "jsonls",
  -- "nil_ls",
  -- "powershell_es",
  "regal",
  "rust_analyzer",
  -- "snyk-ls",
  -- "solargraph", -- ruby
  -- "sqls",
  -- "taplo",
  -- "terraformls",
}
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, { capabilities = capabilities })
  vim.lsp.enable(lsp)
end

----------------------------- GitHub Actions --------------------------------
-- Override cmd: lspconfig defaults to the deprecated gh-actions-language-server
-- wrapper. Use the official @actions/languageserver binary instead.
-- TODO: Drop cmd override once lspconfig updates upstream.
vim.lsp.config("gh_actions_ls", {
  cmd = { "actions-languageserver", "--stdio" },
  capabilities = capabilities,
  before_init = function(params, config)
    if config.root_dir and vim.fn.executable("gh") == 1 then
      local result =
        vim.system({ "gh", "auth", "token", "-h", "github.com" }):wait()
      if result.code == 0 then
        params.initializationOptions.sessionToken = vim.trim(result.stdout)
      end
    end
  end,
})
vim.lsp.enable("gh_actions_ls")

-------------------------------- JavaScript --------------------------------
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})
vim.lsp.enable("ts_ls")
--
----------------------------------- JSON -----------------------------------
vim.lsp.config("jsonls", {
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})
vim.lsp.enable("jsonls")

----------------------------------- Lua ------------------------------------
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
  settings = {
    Lua = {
      completion = { keywordSnippet = "Disable" },
      diagnostics = {
        globals = { "renoise", "vim" },
      },
      format = { enable = false },
      runtime = { version = "LuaJIT" },
      telemetry = { enable = false },
      workspace = { checkThirdParty = false },
    },
  },
})
vim.lsp.enable("lua_ls")

----------------------------------- Nix ------------------------------------
vim.lsp.config("nil_ls", {
  capabilities = capabilities,
  settings = { ["nil"] = { formatting = { command = { "nixfmt" } } } },
})
vim.lsp.enable("nil_ls")

---------------------------------- Python ----------------------------------
-- vim.lsp.config("basedpyright", {
--   capabilities = capabilities,
--   settings = {
--     python = {
--       pythonPath = vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV .. "/bin/python"
--         or "python",
--     },
--   },
-- })
-- vim.lsp.enable("basedpyright")

vim.lsp.config("pyright", {
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        diagnosticSeverityOverrides = {
          -- reportUnknownArgumentType = "warning",
          reportPrivateImportUsage = "information",
          -- reportUnknownLambdaType = "warning",
          -- reportUnknownMemberType = "warning",
          -- reportUnknownParameterType = "warning",
          -- reportUnknownVariableType = "warning",
        },
        -- reportMissingTypeStubs = true,
        -- reportPrivateImportUsage = false,
        -- typeCheckingMode = "strict",
      },
      pythonPath = vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV .. "/bin/python"
        or "python",
    },
  },
})
vim.lsp.enable("pyright")

-- Disable some ty functionality in favor of pyright while in parllel
vim.lsp.config("ty", {
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.declarationProvider = false
    client.server_capabilities.definitionProvider = false
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.referencesProvider = false
    client.server_capabilities.typeDefinitionProvider = false
  end,
})
vim.lsp.enable("ty")

vim.lsp.config("ruff", {
  capabilities = capabilities,
  init_options = {
    settings = {
      args = {
        "--select=A,B,C4,C90,D,E,F,N,PIE,PT003,PT006,PT008,PT022,RET504,SIM,T20,UP,W",
        "--ignore=D1,D203,D205,D212,D213,D400,D404,D415,I,N818",
      },
    },
  },
})
vim.lsp.enable("ruff")

----------------------------------- SQL ------------------------------------
-- TODO: Figure out why this doesn't work.
-- vim.lsp.config("sqls", {
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
-- vim.lsp.enable("sqls")

----------------------------------- TOML -----------------------------------
vim.lsp.config("taplo", {
  capabilities = capabilities,
  settings = {
    evenBetterToml = {
      schema = {
        enabled = true,
        repositoryEnabled = true,
        repositoryUrl = "https://taplo.tamasfe.dev/schema_index.json",
      },
      cachePath = vim.fn.stdpath("cache") .. "/taplo",
      -- Apparently removing this borks the settings?!
      formatter = {
        alignComments = false,
        -- indentTables = true,
      },
    },
  },
})
vim.lsp.enable("taplo")

--------------------------------- Policist ---------------------------------
-- Static validation of AWS IAM policies in Terraform/JSON.
vim.lsp.config("policist", {
  cmd = { "policist", "lsp" },
  capabilities = capabilities,
  filetypes = { "json", "terraform" },
  root_markers = { ".policist.toml", ".git" },
  single_file_support = true,
})
vim.lsp.enable("policist")

-------------------------------- Terraform ---------------------------------
vim.lsp.config("terraformls", {
  capabilities = capabilities,
  on_init = function(client, _)
    -- Disable syntax highlighting (use Treesitter instead)
    client.server_capabilities.semanticTokensProvider = nil
  end,
  filetypes = {
    -- "hcl",
    "terraform",
    "terraform-vars",
  },
  settings = {
    terraformls = {
      experimentalFeatures = { prefillRequiredFields = true },
    },
  },
})
vim.lsp.enable("terraformls")

---------------------------------- TFLint ----------------------------------
vim.lsp.config("tflint", {
  capabilities = capabilities,
  before_init = function()
    vim.system({ "tflint", "--init" }):wait()
  end,
})
vim.lsp.enable("tflint")

-------------------------------- Vimscript ---------------------------------
vim.lsp.config("vimls", {
  capabilities = capabilities,
  init_options = {
    runtimepath = vim.o.runtimepath,
    indexes = { gap = 75, count = 5 },
  },
})
vim.lsp.enable("vimls")

----------------------------------- YAML -----------------------------------
vim.lsp.config("yamlls", {
  capabilities = capabilities,
  settings = {
    yaml = {
      customTags = {
        "!Ref",
        "!Split sequence",
        "!Sub sequence",
      },
      schemaStore = { enable = true },
      schemas = {
        ["https://json.schemastore.org/github-workflow"] = "*/.github/workflows/*",
        ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "*.cf.yaml",
      },
      validate = true,
    },
  },
})
vim.lsp.enable("yamlls")

-- vim.lsp.config("yamlls", {
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
-- vim.lsp.enable("yamlls")

-- mason-lspconfig: install the servers configured above. Runs last so mason and
-- the `vim.lsp.config`/`vim.lsp.enable` calls are already in place.
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    -- "nil_ls",
    "pyright",
    "regal",
    "ruff",
    "rust_analyzer",
    -- "snyk_ls",
    "taplo",
    "terraformls",
    "ts_ls",
    "tflint",
    "ty",
    "vimls",
    "yamlls",
  },
})
