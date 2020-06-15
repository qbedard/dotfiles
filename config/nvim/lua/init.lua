local M = {}

function M.setup_nvim_lsp()

  --- sql-langauge-server config ---
  -- local configs = require 'nvim_lsp/configs'
  -- local util = require 'nvim_lsp/util'

  -- configs.sql = {
  --   default_config = {
  --     cmd = {'sql-language-server', 'up', '--method', 'stdio'};
  --     filetypes = {"sql"};
  --     root_dir = function(fname)
  --       return util.path.dirname(fname)
  --     end;
  --   };
  --   docs = {
  --     package_json = "https://raw.githubusercontent.com/joe-re/sql-language-server/master/package.json";
  --     description = [[
  -- https://github.com/joe-re/sql-language-server
  -- `sql-language-server`, a language server for SQL.
  --     ]];
  --     default_config = {
  --       root_dir = "vim's starting directory";
  --     };
  --   };
  -- };

  local on_attach = function()
    require'completion'.on_attach()
    require'diagnostic'.on_attach()
  end

  require'nvim_lsp'.bashls.setup{on_attach=on_attach}
  require'nvim_lsp'.cssls.setup{on_attach=on_attach}
  require'nvim_lsp'.html.setup{on_attach=on_attach}
  require'nvim_lsp'.pyls.setup{
    on_attach = on_attach,
    settings = {
      pyls = {
        configurationSources = {'flake8'},
        plugins = {
          autopep8 = {enabled = false},
          black = {enabled = true},
          flake8 = {
            enabled = true,
          },
          pycodestyle = {
            enabled = false,
            maxLineLength = 88,
          },
          pyflakes = {enabled = false},
          yapf = {enabled = false},
        },
      },
    },
  }
  -- require'nvim_lsp'.sql.setup{on_attach=on_attach}
  -- require'nvim_lsp'.sumneko_lua.setup{
  --   on_attach = on_attach,
  --   cmd = {"path", "to", "cmd"};
  -- }
  require'nvim_lsp'.tsserver.setup{on_attach=on_attach}
  require'nvim_lsp'.vimls.setup{
    on_attach=on_attach,
    init_options = {
      runtimepath = vim.api.nvim_get_option('runtimepath'),
      indexes = {
        gap = 75,
        count = 5,
      },
    },
  }
  require'nvim_lsp'.yamlls.setup{
    on_attach = on_attach,
    settings = {
      yaml = {
        format = {
          enable = true,
          singleQuote = true,
        },
        validate = true,
      },
    },
  }

end

return M
