return {
  "echasnovski/mini.nvim",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    -- TODO?
    -- require("mini.basics").setup()
    -- require("mini.completion").setup()
    -- require("mini.diff").setup()
    -- require("mini.jump").setup()
    -- require("mini.move").setup()
    -- require("mini.statusline").setup()
    -- require("mini.tabline").setup()

    require("mini.ai").setup({
      custom_textobjects = {
        F = require("mini.ai").gen_spec.treesitter({
          a = "@function.outer",
          i = "@function.inner",
        }),
      },
    })
    -- Recreate "inside line" text object
    vim.keymap.set("x", "il", "^og_")
    vim.keymap.set("o", "il", ":normal vil<CR>")

    -- require("mini.animate").setup({ cursor = { enable = false } })
    require("mini.bracketed").setup()

    local miniclue = require("mini.clue")
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
      },
    })

    require("mini.comment").setup()

    require("mini.cursorword").setup()
    vim.api.nvim_set_hl(0, "MiniCursorword", { link = "CursorLine" })
    local cursorword_filetype = vim.api.nvim_create_augroup("cursorword_filetype", {})
    vim.api.nvim_create_autocmd("FileType", {
      group = cursorword_filetype,
      pattern = "telescope",
      callback = function()
        vim.b.minicursorword_disable = true
      end,
    })

    -- local indentscope = require("mini.indentscope")
    -- indentscope.setup({
    --   draw = {
    --     delay = 50,
    --     animation = indentscope.gen_animation.linear({ duration = 1 }),
    --   },
    --   symbol = require("icons").bar.thin,
    -- })
    -- vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { link = "GruvboxAqua" })
    -- vim.api.nvim_set_hl(0, "MiniIndentscopeSymbolOff", { link = "GruvboxRed" })

    local map = require("mini.map")
    map.setup({
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.diagnostic({
          error = "DiagnosticFloatingError",
          warn = "DiagnosticFloatingWarn",
          info = "DiagnosticFloatingInfo",
          hint = "DiagnosticFloatingHint",
        }),
        map.gen_integration.gitsigns(),
      },
      symbols = { encode = map.gen_encode_symbols.dot("4x2"), scroll_line = "⏵" },
      window = { show_integration_count = false, width = 5 },
    })
    for _, key in ipairs({ "n", "N", "*", "#" }) do
      vim.keymap.set(
        "n",
        key,
        key .. "<Cmd>lua MiniMap.refresh({}, {lines = false, scrollbar = false})<CR>"
      )
    end
    map.open()

    require("mini.misc").setup()
    require("mini.operators").setup()
    require("mini.pairs").setup({
      modes = { insert = true, terminal = true },
    })

    -- maybe with https://github.com/echasnovski/mini.nvim/discussions/36#discussioncomment-8382869
    -- local splitjoin = require("mini.splitjoin")
    -- splitjoin.setup({
    --   split = { hooks_post = { splitjoin.gen_hook.add_trailing_separator() } },
    --   join = { hooks_post = { splitjoin.gen_hook.del_trailing_separator() } },
    -- }) -- TODO

    require("mini.surround").setup({
      mappings = {
        add = "ys",
        delete = "ds",
        find = "",
        find_left = "",
        highlight = "",
        replace = "cs",
        update_n_lines = "",
      },
      search_method = "cover_or_next",
    })
    vim.keymap.del({ "v" }, "ys")
    -- TODO: Figure out why I can't call MiniSurround.add directly here.
    vim.keymap.set({ "v", "x" }, "S", ":<C-u>lua MiniSurround.add('visual')<CR>")
    -- TODO: Figure out why this doesn't work.
    -- vim.keymap.set("n", "yss", "ys_")

    local trailspace = require("mini.trailspace")
    vim.api.nvim_create_user_command("Trim", function()
      trailspace.trim()
      trailspace.trim_last_lines()
    end, { bang = true })
  end,
}
