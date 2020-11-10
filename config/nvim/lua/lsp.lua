local nvim_lsp = require'nvim_lsp'
local configs = require'nvim_lsp/configs'
local util = require'nvim_lsp/util'

--- pyright config ---
configs.pyright = {
  default_config = {
    cmd = {'pyright-langserver', '--stdio'},
    filetypes = {'python'},
    root_dir = util.root_pattern('.git', 'setup.py',  'setup.cfg', 'pyproject.toml', 'requirements.txt'),
    settings = {
      analysis = { autoSearchPaths= true; },
      pyright = { useLibraryCodeForTypes = true; },
    },
    before_init = function(initialize_params)
      initialize_params['workspaceFolders'] = {
        { name = 'workspace', uri = initialize_params['rootUri'] }
      }
    end
    },
  docs = {
    description = [[
      https://github.com/microsoft/pyright
      `pyright`, a static type checker and language server for python
    ]];
  }
}

--- sql-langauge-server config ---
-- configs.sql = {
--   default_config = {
--     cmd = {'sql-language-server', 'up', '--method', 'stdio'},
--     filetypes = {"sql"},
--     root_dir = function(fname) return util.path.dirname(fname) end
--   },
--   docs = {
--     package_json = "https://raw.githubusercontent.com/joe-re/sql-language-server/master/package.json",
--     description = [[
-- https://github.com/joe-re/sql-language-server
-- `sql-language-server`, a language server for SQL.
--     ]],
--     default_config = {root_dir = "vim's starting directory"}
--   }
-- }

-- TODO: terraform-ls

local on_attach = function()
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
  require'folding'.on_attach()
end


-- simple setups --
local servers = {
  'bashls',
  -- 'ccls',
  -- 'cmake',
  'cssls',
  'dockerls',
  'html',
  'jsonls',
  -- 'pyright',
  -- 'sql',
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- complex setups --
require'nvim_lsp'.pyls.setup {
  on_attach = on_attach,
  settings = {
    pyls = {
      configurationSources = {'flake8'},
      plugins = {
        autopep8 = {enabled = false},
        black = {enabled = true},
        flake8 = {enabled = true},
        -- jedi_signature_help = {enabled = false}, -- stupid slow
        mccabe = {enabled = false},
        pycodestyle = {enabled = false, maxLineLength = 88},
        pyflakes = {enabled = false},
        yapf = {enabled = false}
      }
    }
  }
}
require'nvim_lsp'.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME')] = true,
          -- TODO: Add plugins?
        },
        maxPreload = 2000,
        preloadFileSize = 1000,
      },
      runtime = {
        version = 'LuaJIT',
        path = { "?.lua", "?/init.lua", "?/?.lua" }
      },
      diagnostics = {
        enable = true,
        globals = {'use', 'vim'},
      }
    }
  },
--         "workspace": {
--             "library": {
--                 "/path/to/hammerspoon-completion/build/stubs": true,
--                 "/path/to/neovim/runtime/lua": true
--             },
--             "maxPreload": 2000,
--             "preloadFileSize": 1000
--         },
--         "runtime": {
--             "version": "Lua 5.4"
--         },
--         "diagnostics": {
--             "enable": true,
--             "globals": ["hs", "vim", "it", "describe", "before_each", "after_each"],
--             "disable": ["lowercase-global"]
--         },
--         "completion": {
--             "keywordSnippet": "Disable"
--         }
--     }
  cmd = {
    -- TODO: Make work on other Linux as well
    vim.fn.stdpath('cache') .. '/lua-language-server/bin/macOS/lua-language-server'
  },
}
require'nvim_lsp'.tsserver.setup {on_attach = on_attach}
require'nvim_lsp'.vimls.setup {
  on_attach = on_attach,
  init_options = {
    runtimepath = vim.api.nvim_get_option('runtimepath'),
    indexes = {gap = 75, count = 5}
  }
}
require'nvim_lsp'.yamlls.setup {
  on_attach = on_attach,
  settings = {
    yaml = {format = {enable = true, singleQuote = true}, validate = true}
  }
}
