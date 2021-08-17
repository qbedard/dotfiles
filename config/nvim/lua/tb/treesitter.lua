require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  highlight = {enable = true},
  -- incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = "gnn",
  --     node_incremental = "grn",
  --     scope_incremental = "grc",
  --     node_decremental = "grm"
  --   }
  -- },
  -- indent = {enable = true},

  --- nvim-treesitter-refactor ---
  -- refactor = {
  --   highlight_current_scope = {enable = false},
  --   highlight_definitions = {enable = true},
  --   navigation = {
  --     enable = true,
  --     keymaps = {
  --       goto_definition = "gnd",
  --       list_definitions = "gnD",
  --       list_definitions_toc = "gO",
  --       goto_next_usage = "<a-*>",
  --       goto_previous_usage = "<a-#>"
  --     }
  --   }
  -- },

  --- nvim-treesitter-textobjects ---
  -- TODO: Replace other textobject plugins with this
  textobjects = {
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer"
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer"
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer"
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer"
      }
    },
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function"
        }
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>l"] = "@parameter.inner"
      },
      swap_previous = {
        ["<leader>h"] = "@parameter.inner"
      }
    }
  },
  --- nvim-ts-autotag ---
  autotag = {
    enable = true,
    filetypes = {"html", "javascriptreact", "xml"}
  }
}

if require("nvim-treesitter.parsers").has_parser("python") then
  require("vim.treesitter.query").set_query(
    "python",
    "folds",
    [[
      [
        (function_definition)
        (class_definition)

        (while_statement)
        (for_statement)
        (if_statement)
        (with_statement)
        (try_statement)

        (import_from_statement)
        (parameters)
        (argument_list)

        (parenthesized_expression)
        (generator_expression)
        (list_comprehension)
        (set_comprehension)
        (dictionary_comprehension)

        (tuple)
        (list)
        (set)
        (dictionary)

        (string)
      ] @fold
    ]]
  )
end
