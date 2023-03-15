return {
  -- {
  --   "folke/noice.nvim",
  --   dependencies = "MunifTanjim/nui.nvim",
  --   event = "VimEnter",
  --   config = true,
  -- },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    opts = { sign_priority = 0 },
  },

  {
    "NvChad/nvim-colorizer.lua",
    ft = { "css", "scss", "html" },
    opts = { user_default_options = { mode = "virtualtext" } },
  },

  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    opts = {
      open_mapping = "<c-t>",
      direction = "float",
      float_opts = { border = "rounded" },
    },
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

  "stevearc/dressing.nvim",
  { "j-hui/fidget.nvim", opts = { text = { spinner = "dots" } } },

  "kshenoy/vim-signature",

  "justinmk/vim-dirvish",
  "romainl/vim-cool",
  "farmergreg/vim-lastplace",

  "tpope/vim-abolish",
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tpope/vim-rhubarb",
  "tpope/vim-unimpaired",

  -- Text Objects
  -- TODO: Replace with mini.ai
  "wellle/targets.vim",
  "michaeljsmith/vim-indent-object",

  {
    "Wansmer/treesj",
    keys = { { "gS", "<cmd>TSJSplit<CR>" }, { "gJ", "<cmd>TSJJoin<CR>" } },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { use_default_keymaps = false },
  },

  -- Language Support
  "Vimjas/vim-python-pep8-indent",
  "sophacles/vim-bundle-mako",
  { "Glench/Vim-Jinja2-Syntax", ft = { "html", "jinja" } },
  "vim-test/vim-test",
}
