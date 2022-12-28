return {
  "echasnovski/mini.nvim",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    -- require("mini.ai").setup({
    --   custom_textobjects = {
    --     F = require("mini.ai").gen_spec.treesitter({
    --       a = "@function.outer",
    --       i = "@function.inner",
    --     }),
    --     -- TODO: line
    --   },
    -- })
    require("mini.comment").setup({})
    -- require("mini.completion").setup({}) -- TODO

    require("mini.cursorword").setup({})
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
    -- indentscope.setup({ symbol = require("tb.icons").bar.thin })
    -- indentscope.gen_animation('none')

    -- require("mini.jump").setup() -- TODO?

    -- local map = require("mini.map")
    -- map.setup({
    --   integrations = {
    --     map.gen_integration.builtin_search(),
    --     map.gen_integration.gitsigns(),
    --     map.gen_integration.diagnostic(),
    --   },
    -- })

    require("mini.misc").setup({})
    require("mini.pairs").setup({
      modes = { insert = true, command = true, terminal = true },
    })
    -- require("mini.statusline").setup() -- TODO

    local surround = require("mini.surround")
    surround.setup({
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

    -- require("mini.tabline").setup({}) -- TODO

    local trailspace = require("mini.trailspace")
    vim.api.nvim_create_user_command("Trim", function()
      trailspace.trim()
      trailspace.trim_last_lines()
    end, { bang = true })
  end,
}
