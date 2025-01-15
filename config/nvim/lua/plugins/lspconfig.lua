return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "folke/lazydev.nvim",
    "williamboman/mason.nvim",
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        automatic_installation = {
          exclude = {
            "rust_analyzer",
            -- "terraformls",
            "lua_ls",
            "nil_ls",
            "taplo",
          },
        },
      },
    },
  },
  keys = {
    { "<Leader>d", vim.diagnostic.open_float },
    { "<Leader>e", vim.diagnostic.open_float },
    { "[d", vim.diagnostic.goto_prev },
    { "]d", vim.diagnostic.goto_next },
    { "<Leader>q", vim.diagnostic.setloclist },
    { "gD", vim.lsp.buf.declaration },
    { "gd", vim.lsp.buf.definition },
    { "<Leader>D", vim.lsp.buf.type_definition },
    { "<Leader>k", vim.lsp.buf.hover },
    { "<Leader>s", vim.lsp.buf.signature_help },
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

    for name, icon in pairs({
      Error = i.diag.error,
      Warn = i.diag.warn,
      Info = i.diag.info,
      Hint = i.diag.hint,
      Ok = i.diag.ok,
    }) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name })
    end

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
      "docker_compose_language_service",
      "dockerls",
      "gopls",
      "html",
      "jsonls",
      -- "nil_ls",
      -- "powershell_es",
      "rust_analyzer",
      -- "sqls",
      -- "taplo",
      -- "solargraph", -- ruby
      -- "terraformls",
      "tflint", -- TODO: Add `tflint --init`?
    }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({ capabilities = capabilities })
    end

    -------------------------------- JavaScript --------------------------------
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = function(client)
        client.server_capabilities.document_formatting = false
      end,
    })
    --
    ----------------------------------- JSON -----------------------------------
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      on_attach = function(client)
        client.server_capabilities.document_formatting = false
      end,
    })

    ----------------------------------- Lua ------------------------------------
    lspconfig.lua_ls.setup({
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

    ----------------------------------- Nix ------------------------------------
    lspconfig.nil_ls.setup({
      capabilities = capabilities,
      settings = { ["nil"] = { formatting = { command = { "nixfmt" } } } },
    })

    ---------------------------------- Python ----------------------------------
    -- lspconfig.basedpyright.setup({
    --   capabilities = capabilities,
    --   settings = {
    --     python = {
    --       pythonPath = vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV .. "/bin/python"
    --         or "python",
    --     },
    --   },
    -- })

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

    lspconfig.ruff.setup({
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

    lspconfig.terraformls.setup({
      capabilities = capabilities,
      on_init = function(client, _)
        -- Disable syntax highlighting (use Treesitter instead)
        client.server_capabilities.semanticTokensProvider = nil
      end,
      settings = {
        terraformls = {
          experimentalFeatures = { prefillRequiredFields = true },
        },
      },
    })

    -------------------------------- Vimscript ---------------------------------
    lspconfig.vimls.setup({
      capabilities = capabilities,
      init_options = {
        runtimepath = vim.o.runtimepath,
        indexes = { gap = 75, count = 5 },
      },
    })

    ----------------------------------- YAML -----------------------------------
    lspconfig.yamlls.setup({
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
