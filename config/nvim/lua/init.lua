local M = {}

function M.setup_nvim_treesitter()
  -- TODO: To enable TS syntax-based code folding:
  -- set foldmethod=expr
  -- set foldexpr=nvim_treesitter#foldexpr()

  require'nvim-treesitter.configs'.setup {

    -- TODO: Try switching from other tools to TS-based solutions

    -- highlight = {
    --   enable = true,
    --   use_languagetree = false, -- Use this to enable language injection (this is very unstable)
    -- },

    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = "gnn",
    --     node_incremental = "grn",
    --     scope_incremental = "grc",
    --     node_decremental = "grm",
    --   },
    -- },

    -- indent = { enable = true },

    --- nvim-treesitter-refactor ---
    -- refactor = {
    --   highlight_current_scope = { enable = false },
    --   highlight_definitions = { enable = true },
    --   navigation = {
    --     enable = true,
    --     keymaps = {
    --       goto_definition = "gnd",
    --       list_definitions = "gnD",
    --       list_definitions_toc = "gO",
    --       goto_next_usage = "<a-*>",
    --       goto_previous_usage = "<a-#>",
    --     },
    --   },
    -- },

    --- nvim-treesitter-textobjects ---
    -- textobjects = {
    --   move = {
    --     enable = true,
    --     goto_next_start = {
    --       ["]m"] = "@function.outer",
    --       ["]]"] = "@class.outer",
    --     },
    --     goto_next_end = {
    --       ["]M"] = "@function.outer",
    --       ["]["] = "@class.outer",
    --     },
    --     goto_previous_start = {
    --       ["[m"] = "@function.outer",
    --       ["[["] = "@class.outer",
    --     },
    --     goto_previous_end = {
    --       ["[M"] = "@function.outer",
    --       ["[]"] = "@class.outer",
    --     },
    --   },
    --   select = {
    --     enable = true,
    --     keymaps = {
    --       -- You can use the capture groups defined in textobjects.scm
    --       ["af"] = "@function.outer",
    --       ["if"] = "@function.inner",
    --       ["ac"] = "@class.outer",
    --       ["ic"] = "@class.inner",

    --       -- Or you can define your own textobjects like this
    --       ["iF"] = {
    --         python = "(function_definition) @function",
    --         cpp = "(function_definition) @function",
    --         c = "(function_definition) @function",
    --         java = "(method_declaration) @function",
    --       },
    --     },
    --   },
    --   swap = {
    --     enable = true,
    --     swap_next = {
    --       ["<leader>a"] = "@parameter.inner",
    --     },
    --     swap_previous = {
    --       ["<leader>A"] = "@parameter.inner",
    --     },
    --   },
    -- },

  }
end

function M.setup_nvim_lsp()

  --- sql-langauge-server config ---
  -- local configs = require 'nvim_lsp/configs'
  -- local util = require 'nvim_lsp/util'

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
  -- };

  -- TODO: terraform-ls

  local on_attach = function()
    require'completion'.on_attach()
    require'diagnostic'.on_attach()
    require'folding'.on_attach()
  end

  require'nvim_lsp'.bashls.setup {on_attach = on_attach}
  -- require'nvim_lsp'.ccls.setup {on_attach = on_attach}
  -- require'nvim_lsp'.cmake.setup {on_attach = on_attach}
  require'nvim_lsp'.cssls.setup {on_attach = on_attach}
  require'nvim_lsp'.dockerls.setup {on_attach = on_attach}
  require'nvim_lsp'.html.setup {on_attach = on_attach}
  require'nvim_lsp'.jsonls.setup {on_attach = on_attach}
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
  -- require'nvim_lsp'.sql.setup {on_attach = on_attach}
  -- require'nvim_lsp'.sumneko_lua.setup {
  --   on_attach = on_attach,
  --   settings = {
  --     Lua = {
  --       runtime = {version = "LuaJIT"},
  --       diagnostics = {
  --         enable = true,
  --         globals = {"vim", "spoon", "hs"},
  --       }
  --     }
  --   },
  --   cmd = {
  --     vim.api.nvim_eval(
  --       "expand('$PLUGGED/lua-language-server/bin/macOS/lua-language-server')"
  --       )
  --   },
  -- }
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

end

return M
