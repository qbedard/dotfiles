local lspconfig = require("lspconfig")
-- local configs = require("lspconfig/configs")
-- local util = require("lspconfig/util")

--- pyright config ---
-- configs.pyright = {
--   default_config = {
--     cmd = {"pyright-langserver", "--stdio"},
--     filetypes = {"python"},
--     root_dir = util.root_pattern(
--       ".git",
--       "setup.py",
--       "setup.cfg",
--       "pyproject.toml",
--       "requirements.txt"
--     ),
--     settings = {
--       python = {
--         analysis = {
--           autoSearchPaths = true,
--           useLibraryCodeForTypes = true
--         }
--       }
--     }
--     -- before_init = function(initialize_params)
--     --   initialize_params["workspaceFolders"] = {
--     --     {name = "workspace", uri = initialize_params["rootUri"]}
--     --   }
--     -- end
--   },
--   docs = {
--     description = [[
--       https://github.com/microsoft/pyright
--       `pyright`, a static type checker and language server for python
--     ]]
--   }
-- }

--- sql-langauge-server config ---
-- configs.sql = {
--   default_config = {
--     cmd = {"sql-language-server", "up", "--method", "stdio"},
--     filetypes = {"sql"},
--     root_dir = function(fname)
--       return util.path.dirname(fname)
--     end
--   },
--   docs = {
--     package_json = "https://raw.githubusercontent.com/joe-re/sql-language-server/master/package.json",
--     description = [[
--       https://github.com/joe-re/sql-language-server
--       `sql-language-server`, a language server for SQL.
--     ]],
--     default_config = {root_dir = "vim's starting directory"}
--   }
-- }

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    update_in_insert = false,
    virtual_text = {
      prefix = ""
    }
  }
)
vim.fn.sign_define(
  "LspDiagnosticsSignError",
  {
    text = "",
    texthl = "LspDiagnosticsSignError"
  }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  {
    text = "",
    texthl = "LspDiagnosticsSignWarning"
  }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  {
    text = "",
    texthl = "LspDiagnosticsSignInformation"
  }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  {
    text = "➤",
    texthl = "LspDiagnosticsSignHint"
  }
)

local on_attach = function()
  require("completion").on_attach()
  -- require("folding").on_attach()
end

-- simple setups --
local servers = {
  "bashls",
  -- "ccls",
  -- "cmake",
  "cssls",
  "dockerls",
  "html",
  "jsonls"
  -- "pyright"
  -- "sql",
  -- "terraformls"
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {on_attach = on_attach}
end

-- complex setups --
lspconfig.pyls.setup {
  on_attach = on_attach,
  settings = {
    pyls = {
      configurationSources = {"flake8"},
      plugins = {
        autopep8 = {enabled = false},
        black = {enabled = true},
        flake8 = {enabled = true},
        -- jedi_signature_help = {enabled = false}, -- stupid slow
        mccabe = {enabled = false},
        pycodestyle = {enabled = false, maxLineLength = 88},
        pyflakes = {enabled = false},
        pyls_mypy = {enabled = false, live_mode = true},
        yapf = {enabled = false}
      }
    }
  }
}

-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   root_dir = function(fname)
--     return util.root_pattern(
--       ".git",
--       "setup.py",
--       "setup.cfg",
--       "pyproject.toml",
--       "requirements.txt"
--     )(fname) or util.path.dirname(fname)
--   end
-- }
local sumneko_root_path =
  vim.fn.stdpath("data") .. "/site/pack/packer/start/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  -- TODO: Make work on Linux as well
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      completion = {kewordSnippet = "Disable"},
      diagnostics = {
        enable = true,
        globals = {"renoise", "use", "vim"}
      },
      runtime = {
        version = "LuaJIT",
        path = {"?.lua", "?/init.lua", "?/?.lua"}
        -- path = vim.split(package.path, ";")
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
          [vim.fn.stdpath("data") .. "/site/pack"] = true
        },
        maxPreload = 2000,
        preloadFileSize = 1000
      }
    }
  }
}
lspconfig.tsserver.setup {on_attach = on_attach}
lspconfig.vimls.setup {
  on_attach = on_attach,
  init_options = {
    runtimepath = vim.api.nvim_get_option("runtimepath"),
    indexes = {gap = 75, count = 5}
  }
}
lspconfig.yamlls.setup {
  on_attach = on_attach,
  settings = {
    yaml = {format = {enable = true, singleQuote = true}, validate = true}
  }
}
