return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    -- "hrsh7th/cmp-buffer",
    -- "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    -- "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  opts = function()
    require("cmp_nvim_lsp").setup()
    local cmp = require("cmp")
    local icons = require("icons")
    local lspkind = require("lspkind")
    return {
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      -- formatting = { format = lspkind.cmp_format({ mode = "symbol" }) },
      formatting = {
        format = function(_, item)
          if icons.kind[item.kind] then
            item.kind = icons.kind[item.kind]
          end
          return item
        end,
      },
      -- NOTE: Only useful for cmp-path
      -- formatting = {
      --   format = function(entry, vim_item)
      --     if vim.tbl_contains({ "path" }, entry.source.name) then
      --       local icon, hl_group = require("nvim-web-devicons").get_icon(
      --         entry:get_completion_item().label
      --       )
      --       if icon then
      --         vim_item.kind = icon
      --         vim_item.kind_hl_group = hl_group
      --         return vim_item
      --       end
      --     end
      --     return lspkind.cmp_format({ mode = "symbol" })(entry, vim_item)
      --   end,
      -- },

      min_length = 0, -- allow for `from package import _` in Python
      mapping = cmp.mapping.preset.insert({
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    }

    -- TODO: Get this working?
    -- cmp.setup.cmdline({ "/", "?" }, {
    --   -- completion = { autocomplete = false },
    --   mapping = cmp.mapping.preset.cmdline({
    --     ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    --     ["<Tab>"] = cmp.mapping.select_next_item(),
    --     ["<C-Space>"] = cmp.mapping.complete(),
    --     ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
    --   }),
    --   sources = { { name = "buffer" } },
    -- })
    --
    -- cmp.setup.cmdline(":", {
    --   -- completion = { autocomplete = false },
    --   mapping = cmp.mapping.preset.cmdline({
    --     ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    --     ["<Tab>"] = cmp.mapping.select_next_item(),
    --     ["<C-Space>"] = cmp.mapping.complete(),
    --     ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
    --   }),
    --   sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    -- })
  end,
}
