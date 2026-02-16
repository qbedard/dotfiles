local icons = require("icons")
local kind_icons = vim.tbl_extend("force", icons.kind, {
  EnumMember = icons.lang.enummember,
  TypeParameter = icons.lang.typeparameter,
})

return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = "folke/lazydev.nvim",
  opts = {
    appearance = { kind_icons = kind_icons },
    completion = {
      keyword = { range = "full" },
      menu = { border = "rounded" },
      documentation = { window = { border = "rounded" } },
    },
    keymap = {
      preset = "none",
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Tab>"] = {
        function()
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
            return true
          end
        end,
        "select_next",
        "fallback",
      },
      ["<C-Space>"] = { "show", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
    cmdline = { enabled = true },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
  },
}
