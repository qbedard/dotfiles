return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    {
      "<Leader><Leader>",
      function()
        require("telescope.builtin").builtin()
      end,
    },
    {
      "<C-p>",
      function()
        require("telescope.builtin").find_files({
          cwd = require("lspconfig.util").root_pattern(".git")(
            vim.fn.expand("%:p") or vim.loop.cwd()
          ),
        })
      end,
    },
    {
      "<C-b>",
      function()
        require("telescope.builtin").buffers()
      end,
    },
  },
  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        layout_strategy = "flex",
        layout_config = {
          flex = {
            flip_columns = 160,
            horizontal = { preview_width = 0.5 },
            vertical = { preview_height = 0.4 },
          },
        },
        mappings = {
          i = {
            ["<CR>"] = actions.select_default + actions.center,
            ["<esc>"] = actions.close,
            ["<tab>"] = actions.add_selection,
          },
        },
        color_devicons = true,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
      },
      pickers = {
        find_files = {
          find_command = {
            "fd",
            "--type",
            "f",
            "--strip-cwd-prefix",
            "--hidden",
            "--follow",
            "--no-ignore-vcs",
          },
        },
      },
    }
  end,
  config = function(plugin, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("fzf")
  end,
}
