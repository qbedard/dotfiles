return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },
  opts = {
    ensure_installed = "all",
    highlight = { enable = true, disable = { "scss" } },
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
    -- TODO: Replace other textobject plugins with this?
    textobjects = {
      move = {
        enable = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      select = {
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>l"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>h"] = "@parameter.inner",
        },
      },
    },
    --- nvim-ts-autotag ---
    autotag = {
      enable = true,
      filetypes = { "html", "javascriptreact", "xml" },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.treesitter.language.register("terraform", "terraform-vars")
  end,
}
