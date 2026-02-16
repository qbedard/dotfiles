return {
  -- Plugins eliminated by snacks --
  { "j-hui/fidget.nvim", opts = {} }, -- TODO: Replace with notifier LSP progress?
  -- "justinmk/vim-dirvish",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- {
  --   "folke/noice.nvim",
  --   dependencies = "MunifTanjim/nui.nvim",
  --   event = "VimEnter",
  --   config = true,
  -- },

  -- {
  --   "frankroeder/parrot.nvim",
  --   dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  --   main = "parrot",
  --   opts = {
  --     providers = {
  --       github = { api_key = vim.fn.system({ "gh", "auth", "token" }) },
  --     },
  --   },
  -- },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    opts = { sign_priority = 0 },
  },

  {
    "catgoose/nvim-colorizer.lua",
    ft = { "css", "scss", "html" },
    opts = { user_default_options = { mode = "virtualtext" } },
  },

  {
    "iamcco/markdown-preview.nvim",
    build = ":call mkdp#util#install()",
    ft = "markdown",
  },

  {
    "unblevable/quick-scope",
    init = function()
      vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
    end,
  },

  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },

  -- "gravndal/shiftwidth_leadmultispace.nvim",  -- TODO

  "kshenoy/vim-signature",

  "romainl/vim-cool",
  "farmergreg/vim-lastplace",

  "tpope/vim-abolish",
  "tpope/vim-eunuch",

  "michaeljsmith/vim-indent-object",

  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    -- keys = { { "gS", "<Cmd>TSJSplit<CR>" }, { "gJ", "<Cmd>TSJJoin<CR>" } },
    -- opts = { use_default_keymaps = false },
    -- https://github.com/nvim-mini/mini.nvim/discussions/36#discussioncomment-8382869
    keys = { { "<leader>m", mode = { "n", "v" }, desc = "Toggle split" } },
    config = function()
      require("treesj").setup({
        max_join_length = 512,
        use_default_keymaps = false,
      })

      local function get_pos_lang(node)
        local c = vim.api.nvim_win_get_cursor(0)
        local range = { c[1] - 1, c[2], c[1] - 1, c[2] }
        local buf = vim.api.nvim_get_current_buf()
        local ok, parser = pcall(
          vim.treesitter.get_parser,
          buf,
          vim.treesitter.language.get_lang(vim.bo[buf].ft)
        )
        if not ok then
          return ""
        end
        ---@diagnostic disable-next-line: need-check-nil
        local current_tree = parser:language_for_range(range)
        return current_tree:lang()
      end

      vim.keymap.set({ "n", "v" }, "gS", function()
        local tsj_langs = require("treesj.langs")["presets"]
        local lang = get_pos_lang()
        if lang ~= "" and tsj_langs[lang] then
          require("treesj").toggle()
        else
          require("mini.splitjoin").toggle()
        end
      end)
    end,
  },

  -- Language Support
  "sophacles/vim-bundle-mako",
  { "Glench/Vim-Jinja2-Syntax", ft = { "html", "jinja" } },
  "vim-test/vim-test",

  "github/copilot.vim",

  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "actionlint",
        -- "bandit",
        "fish-language-server",
        -- "fish_indent",
        "hclfmt",
        -- "rubocop",
        -- "selene",
        -- "shellcheck",
        -- "sqlfluff",
        "sql_formatter",
        "stylua",
        -- "terraform_fmt",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "bashls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        -- "nil_ls",
        "pyright",
        "regal",
        "ruff",
        "rust_analyzer",
        -- "snyk_ls",
        "taplo",
        "terraformls",
        "ts_ls",
        "tflint",
        "ty",
        "vimls",
      },
    },
  },
}
