return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = { "folke/lazydev.nvim" },
  keys = {
    { "<Leader>d", vim.diagnostic.open_float },
    {
      "[d",
      function()
        vim.diagnostic.jump({ count = -1 })
      end,
    },
    {
      "]d",
      function()
        vim.diagnostic.jump({ count = 1 })
      end,
    },
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
        -- vim.lsp.buf.format({ timeout_ms = 4000 })
        require("conform").format({ timeout_ms = 4000 })
      end,
    },
    { "<Leader>c", vim.lsp.buf.code_action },
  },
  config = function()
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
      "regal",
      "rust_analyzer",
      -- "snyk-ls",
      -- "solargraph", -- ruby
      -- "sqls",
      -- "taplo",
      -- "terraformls",
      "tflint", -- TODO: Add `tflint --init`?
      "ty",
    }
    for _, lsp in ipairs(servers) do
      vim.lsp.config(lsp, { capabilities = capabilities })
      vim.lsp.enable(lsp)
    end

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
          completion = { kewordSnippet = "Disable" },
          diagnostics = {
            globals = { "hs", "renoise", "spoon", "vim" },
          },
          format = { enable = false },
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
  end,
}
