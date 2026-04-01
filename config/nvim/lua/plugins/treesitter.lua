return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = "all" },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.treesitter.language.register("terraform", "terraform-vars")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      local ts = require("nvim-treesitter-textobjects")
      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")
      local swap = require("nvim-treesitter-textobjects.swap")

      ts.setup({})

      -- select
      for _, map in ipairs({
        { "af", "@function.outer" },
        { "if", "@function.inner" },
        { "ac", "@class.outer" },
        { "ic", "@class.inner" },
      }) do
        vim.keymap.set({ "x", "o" }, map[1], function()
          select.select_textobject(map[2], "textobjects")
        end)
      end

      -- move
      for _, map in ipairs({
        { "]m", "@function.outer", "goto_next_start" },
        { "]]", "@class.outer", "goto_next_start" },
        { "]M", "@function.outer", "goto_next_end" },
        { "][", "@class.outer", "goto_next_end" },
        { "[m", "@function.outer", "goto_previous_start" },
        { "[[", "@class.outer", "goto_previous_start" },
        { "[M", "@function.outer", "goto_previous_end" },
        { "[]", "@class.outer", "goto_previous_end" },
      }) do
        local fn = move[map[3]]
        vim.keymap.set({ "n", "x", "o" }, map[1], function()
          fn(map[2], "textobjects")
        end)
      end

      -- swap
      vim.keymap.set("n", "<leader>l", function()
        swap.swap_next("@parameter.inner", "textobjects")
      end)
      vim.keymap.set("n", "<leader>h", function()
        swap.swap_previous("@parameter.inner", "textobjects")
      end)
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    opts = {
      filetypes = { "html", "javascriptreact", "xml" },
    },
  },
}
