return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",
    "williamboman/mason.nvim",
    {
      "williamboman/mason-lspconfig.nvim",
      config = {
        automatic_installation = {
          exclude = {
            "gopls",
            "rust_analyzer",
            "terraformls",
            "sumneko_lua",
            "taplo",
          },
        },
      },
    },
  },
  keys = {
    { "<Leader>d", vim.diagnostic.open_float },
    { "[g", vim.diagnostic.goto_prev },
    { "]g", vim.diagnostic.goto_next },
    { "<Leader>k", vim.lsp.buf.hover },
    { "<Leader>s", vim.lsp.buf.signature_help },
    { "gd", vim.lsp.buf.definition },
    { "1gd", vim.lsp.buf.type_definition },
    { "g0", vim.lsp.buf.document_symbol },
    {
      "gf",
      function()
        vim.lsp.buf.format({ timeout_ms = 4000 })
      end,
    },
    { "<Leader>c", vim.lsp.buf.code_action },
  },
  config = function()
    local lspconfig = require("lspconfig")

    ---------------------------------- Signs -----------------------------------
    local i = require("icons")

    vim.diagnostic.config({
      virtual_text = {
        prefix = i.diag.virtual,
        -- source = "always",
      },
      float = {
        format = function(diagnostic)
          return string.format("%s %s", diagnostic.code, diagnostic.message)
        end,
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

    -- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    -- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    --   opts = opts or {}
    --   opts.border = opts.border or "rounded"
    --   return orig_util_open_floating_preview(contents, syntax, opts, ...)
    -- end

    vim.lsp.handlers["textDocument/hover"] =
      vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    local capabilities = require("cmp_nvim_lsp").default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
    capabilities.textDocument.completion.snippetSupport = false

    ------------------------------ Simple Configs ------------------------------
    local servers = {
      "bashls",
      "ccls",
      -- "clangd",
      -- "cmake",
      "cssls",
      "dockerls",
      "gopls",
      "html",
      -- "jsonls",
      -- "rnix",
      "rust_analyzer",
      -- "sqls",
      -- "taplo",
      -- "solargraph", -- ruby
      "terraformls",
    }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({ capabilities = capabilities })
    end

    ---------------------------------- Python ----------------------------------
    lspconfig.pyright.setup({
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

    ----------------------------------- SQL ------------------------------------
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

    ----------------------------------- Lua ------------------------------------
    lspconfig.sumneko_lua.setup({
      capabilities = capabilities,
      on_attach = function(client)
        client.server_capabilities.document_formatting = false
      end,
      settings = {
        Lua = {
          completion = { kewordSnippet = "Disable" },
          diagnostics = {
            globals = { "hs", "renoise", "spoon", "vim" },
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

    -------------------------------- JavaScript --------------------------------
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = function(client)
        client.server_capabilities.document_formatting = false
      end,
    })

    ----------------------------------- TOML -----------------------------------
    lspconfig.taplo.setup({
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

    -------------------------------- Vimscript ---------------------------------
    lspconfig.vimls.setup({
      capabilities = capabilities,
      init_options = {
        runtimepath = vim.api.nvim_get_option("runtimepath"),
        indexes = { gap = 75, count = 5 },
      },
    })

    ----------------------------------- YAML -----------------------------------
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
  end,
}
