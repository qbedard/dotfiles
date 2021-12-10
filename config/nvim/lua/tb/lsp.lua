local lspconfig = require("lspconfig")

------------------------------------ Signs -------------------------------------
local i = require("tb.icons")

vim.diagnostic.config({
  virtual_text = {
    prefix = i.diag.virtual,
    -- source = "always",
  },
  severity_sort = true,
})

vim.fn.sign_define("DiagnosticSignError", {
  text = i.diag.error,
  texthl = "DiagnosticSignError",
})
vim.fn.sign_define("DiagnosticSignWarn", {
  text = i.diag.warn,
  texthl = "DiagnosticSignWarn",
})
vim.fn.sign_define("DiagnosticSignInfo", {
  text = i.diag.info,
  texthl = "DiagnosticSignInfo",
})
vim.fn.sign_define("DiagnosticSignHint", {
  text = i.diag.hint,
  texthl = "DiagnosticSignHint",
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

-- require("lspconfig").taplo.setup({
--   init_options = {
--     formatter = {
--       alignEntries = true,
--       indentTables = true,
--       reorderKeys = true,
--     },
--   },
-- })

------------------------------------ Python ------------------------------------
local python = "python"
if vim.env.VIRTUAL_ENV then
  python = vim.env.VIRTUAL_ENV .. "/bin/python"
end
lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        -- diagnosticSeverityOverrides = {
        --   reportMissingTypeStubs = true,
        --   reportUnknownArgumentType = "warning",
        --   reportUnknownLambdaType = "warning",
        --   reportUnknownMemberType = "warning",
        --   reportUnknownParameterType = "warning",
        --   reportUnknownVariableType = "warning",
        -- },
        -- typeCheckingMode = "strict",
        useLibraryCodeForTypes = true,
      },
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
