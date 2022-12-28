return {
  -- {
  --   "folke/noice.nvim",
  --   dependencies = "MunifTanjim/nui.nvim",
  --   event = "VimEnter",
  --   config = true,
  -- },

  -- TODO: Switch to this?
  -- {
  --   "feline-nvim/feline.nvim",
  --   config = {
  --     colors = {},
  --     components = {},
  --   },
  -- },

  -- TODO: Switch to this?
  -- { "williamboman/mason.nvim", config = true },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = { sign_priority = 0 },
  },

  {
    "NvChad/nvim-colorizer.lua",
    ft = { "css", "scss", "html" },
    config = {
      user_default_options = { mode = "virtualtext" },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    config = {
      open_mapping = "<c-t>",
      direction = "float",
      float_opts = { border = "curved" },
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
    config = function()
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },

  "stevearc/dressing.nvim",

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
  { "kana/vim-textobj-line", dependencies = "kana/vim-textobj-user" },
  "michaeljsmith/vim-indent-object",

  "AndrewRadev/splitjoin.vim",

  -- Language Support
  "Vimjas/vim-python-pep8-indent",
  "sophacles/vim-bundle-mako",
  { "Glench/Vim-Jinja2-Syntax", ft = { "html", "jinja" } },
  "vim-test/vim-test",
}
