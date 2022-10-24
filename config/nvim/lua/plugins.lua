local ensure_packer = function()
  local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      packer_path,
    })
    vim.cmd("packadd packer.nvim")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup({
  function(use)
    use({ "wbthomason/packer.nvim" })

    use({
      "nvim-treesitter/nvim-treesitter",
      requires = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
      },
      run = ":TSUpdate",
      config = function()
        require("tb.treesitter")
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      end,
    })

    use({
      "ellisonleao/gruvbox.nvim",
      config = function()
        require("gruvbox").setup({
          overrides = {
            -- general
            Function = { link = "GruvboxAqua" },
            Method = { link = "GruvboxAqua" },
            Operator = { link = "GruvboxRed" },
            SignColumn = { link = "GruvboxBg0" },
            GruvboxAquaSign = { bg = "#282828" },
            GruvboxBlueSign = { bg = "#282828" },
            GruvboxGreenSign = { bg = "#282828" },
            GruvboxOrangeSign = { bg = "#282828" },
            GruvboxPurpleSign = { bg = "#282828" },
            GruvboxRedSign = { bg = "#282828" },
            GruvboxYellowSign = { bg = "#282828" },
            NormalFloat = { link = "Float" },
            -- gitsigns
            GitSignsChange = { link = "GruvboxBlueSign" },
          },
        })
        vim.cmd("colorscheme gruvbox")
        vim.cmd("hi clear Error") -- fix some ugly in floats
      end,
    })

    use({
      "akinsho/bufferline.nvim",
      event = "BufWinEnter",
      requires = "kyazdani42/nvim-web-devicons",
      after = { "gruvbox.nvim" },
      config = function()
        local bufferline = require("bufferline")

        bufferline.setup({
          highlights = {
            buffer_selected = { italic = false },
            indicator_selected = {
              fg = { attribute = "fg", highlight = "GruvboxBlue" },
            },
          },
          options = {
            -- always_show_bufferline = false,
            enforce_regular_tabs = true,
            modified_icon = require("tb.icons").file.mod,
            show_buffer_close_icons = false,
            show_close_icon = false,
          },
        })
        vim.keymap.set({ "n", "x" }, "K", function()
          bufferline.cycle(1)
        end)
        vim.keymap.set({ "n", "x" }, "J", function()
          bufferline.cycle(-1)
        end)
      end,
    })

    use({
      "nvim-lualine/lualine.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      after = { "gruvbox.nvim" },
      config = function()
        local i = require("tb.icons")

        require("lualine").setup({
          sections = {
            lualine_a = { "mode" },
            lualine_b = {
              { "branch", icon = "" },
            },
            lualine_c = {
              {
                "diff",
                symbols = {
                  added = i.diff.add_,
                  modified = i.diff.mod_,
                  removed = i.diff.del_,
                },
              },
              {
                "filename",
                path = 1,
                symbols = { modified = i.file._mod, readonly = i.file._lock },
              },
            },
            lualine_x = {
              {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                diagnostics_color = { info = { fg = "#83a598" } },
                symbols = {
                  error = i.diag.error_,
                  warn = i.diag.warn_,
                  info = i.diag.info_,
                  hint = i.diag.hint_,
                },
              },
              "filetype",
            },
            lualine_y = { "progress" },
            lualine_z = { "%3l:%-2c" },
          },
          extensions = { "fugitive" },
        })
      end,
    })

    -- use({
    --   "feline-nvim/feline.nvim",
    --   after = { "gruvbox.nvim" },
    --   config = function()
    --     require("feline").setup({
    --       colors = {},
    --       components = {},
    --     })
    --   end,
    -- })

    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        local i = require("tb.icons")
        require("indent_blankline").setup({
          char = i.bar.thin,
          char_highlight_list = { "GruvboxBg1", "GruvboxBg2" },
          context_highlight_list = { "GruvboxAqua" },
          buftype_exclude = { "help", "terminal" },
          filetype_exclude = { "text", "markdown" },
          show_current_context = true,
          show_first_indent_level = false,
          show_trailing_blankline_indent = false,
        })
      end,
    })

    use({ "RRethy/vim-illuminate" })

    use({
      "edluffy/specs.nvim",
      config = function()
        require("specs").setup({
          min_jump = 20,
          popup = {
            inc_ms = 5,
            blend = 50,
            winhl = "PMenuThumb",
          },
        })
      end,
    })

    use({
      "timbedard/vim-envelop",
      run = ":EnvCreate",
      config = function()
        require("tb.envelop")
      end,
    })

    -- use({
    --   "williamboman/mason.nvim",
    --   config = function()
    --     require("mason").setup()
    --   end,
    -- })

    use({
      "neovim/nvim-lspconfig",
      requires = "folke/neodev.nvim", -- vim lua library
      config = function()
        require("tb.lsp")
        vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float)
        vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]g", vim.diagnostic.goto_next)

        vim.keymap.set("n", "<Leader>k", vim.lsp.buf.hover)
        vim.keymap.set("n", "<Leader>s", vim.lsp.buf.signature_help)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "1gd", vim.lsp.buf.type_definition)
        vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol)
        vim.keymap.set("n", "gf", function()
          vim.lsp.buf.format({ timeout_ms = 4000 })
        end)

        vim.keymap.set("n", "<Leader>c", vim.lsp.buf.code_action)
      end,
    })

    use({
      -- "jose-elias-alvarez/null-ls.nvim",
      "timbedard/null-ls.nvim",
      branch = "more-python-tools",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      config = function()
        require("tb.null-ls")
      end,
    })

    use({
      "onsails/lspkind.nvim",
      config = function()
        local i = require("tb.icons")

        require("lspkind").init({
          symbol_map = {
            Class = i.lang.class,
            Color = i.lang.color,
            Constant = i.lang.constant,
            Constructor = i.lang.constructor,
            Enum = i.lang.enum,
            EnumMember = i.lang.enummember,
            Event = i.lang.event,
            Field = i.lang.field,
            File = i.lang.file,
            Folder = i.lang.folder,
            Function = i.lang["function"],
            Interface = i.lang.interface,
            Keyword = i.lang.keyword,
            Method = i.lang.method,
            Module = i.lang.module,
            Operator = i.lang.operator,
            Property = i.lang.property,
            Reference = i.lang.reference,
            Snippet = i.lang.snippet,
            Struct = i.lang.struct,
            Text = i.lang.text,
            TypeParameter = i.lang.typeparameter,
            Unit = i.lang.unit,
            Value = i.lang.value,
            Variable = i.lang.variable,
          },
        })
      end,
    })

    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
      after = "lspkind.nvim",
      config = function()
        require("cmp_nvim_lsp").setup()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        cmp.setup({
          formatting = { format = lspkind.cmp_format({ mode = "symbol" }) },
          min_length = 0, -- allow for `from package import _` in Python
          mapping = {
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
          },
          sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
          },
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
        })
      end,
    })

    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        local i = require("tb.icons")
        local trouble = require("trouble")

        trouble.setup({
          signs = {
            error = i.diag.error,
            warning = i.diag.warn,
            hint = i.diag.hint,
            information = i.diag.info,
            other = i.diag.pass,
          },
        })

        vim.keymap.set("n", "<Leader>xx", trouble.toggle)
        vim.keymap.set("n", "<Leader>xw", function()
          trouble.toggle("workspace_diagnostics")
        end)
        vim.keymap.set("n", "<Leader>xd", function()
          trouble.toggle("document_diagnostics")
        end)
        vim.keymap.set("n", "<Leader>xl", function()
          trouble.toggle("loclist")
        end)
        vim.keymap.set("n", "<Leader>xc", function()
          trouble.toggle("quickfix")
        end)
        vim.keymap.set("n", "gR", function()
          trouble.toggle("lsp_references")
        end)
      end,
    })

    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
      config = function()
        local custom = require("tb.telescope")
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<Leader><Leader>", builtin.builtin)
        vim.keymap.set("n", "<C-p>", custom.project_files)
        vim.keymap.set("n", "<C-b>", builtin.buffers)
      end,
    })

    use({
      "lewis6991/satellite.nvim",
      config = function()
        require("satellite").setup()
      end,
    })

    use("stevearc/dressing.nvim")

    -- use({
    --   "folke/which-key.nvim",
    --   config = function()
    --     require("which-key").setup({})
    --   end,
    -- })

    use({
      "NvChad/nvim-colorizer.lua",
      opt = true,
      ft = { "css", "scss", "html" },
      config = function()
        require("colorizer").setup({
          user_default_options = { mode = "virtualtext" },
        })
      end,
    })

    use({
      "akinsho/toggleterm.nvim",
      event = "BufWinEnter",
      config = function()
        require("toggleterm").setup({
          open_mapping = "<c-t>",
          direction = "float",
          float_opts = { border = "curved" },
        })
      end,
    })

    use({
      "liuchengxu/vista.vim",
      config = function()
        local i = require("tb.icons")

        vim.g["vista#renderer#icons"] = {
          class = i.lang.class,
          color = i.lang.color,
          constant = i.lang.constant,
          constructor = i.lang.constructor,
          enum = i.lang.enum,
          enummember = i.lang.enummember,
          event = i.lang.event,
          field = i.lang.field,
          file = i.lang.file,
          folder = i.lang.folder,
          ["function"] = i.lang["function"],
          interface = i.lang.interface,
          keyword = i.lang.keyword,
          method = i.lang.method,
          module = i.lang.module,
          operator = i.lang.operator,
          property = i.lang.property,
          reference = i.lang.reference,
          snippet = i.lang.snippet,
          struct = i.lang.struct,
          text = i.lang.text,
          typeparameter = i.lang.typeparameter,
          unit = i.lang.unit,
          value = i.lang.value,
          variable = i.lang.variable,
        }
      end,
    })

    use({
      "iamcco/markdown-preview.nvim",
      run = ":call mkdp#util#install()",
      ft = "markdown",
    })

    use({
      "unblevable/quick-scope",
      config = function()
        vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
      end,
    })

    use({
      "ntpeters/vim-better-whitespace",
      config = function()
        vim.g.better_whitespace_enabled = 0
        vim.g.strip_whitelines_at_eof = 1
        vim.cmd("command! Trim StripWhitespace")
      end,
    })

    use({
      "lewis6991/gitsigns.nvim",
      event = "BufRead",
      config = function()
        require("gitsigns").setup({ sign_priority = 0 })
      end,
    })

    use({
      "andymass/vim-matchup",
      config = function()
        vim.g.matchup_matchparen_offscreen = {}
      end,
    })

    use({
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = function()
        require("nvim-autopairs").setup({})
      end,
    })

    use("kshenoy/vim-signature")

    use("justinmk/vim-dirvish")
    use("romainl/vim-cool")
    use("farmergreg/vim-lastplace")

    use({
      "numToStr/Comment.nvim",
      event = "BufRead",
      config = function()
        require("Comment").setup()
      end,
    })

    use("tpope/vim-abolish")
    use("tpope/vim-eunuch")
    use("tpope/vim-fugitive")
    use("tpope/vim-repeat")
    use("tpope/vim-rhubarb")
    use("tpope/vim-surround")
    use("tpope/vim-unimpaired")

    use("wellle/targets.vim")
    use({ "kana/vim-textobj-line", requires = "kana/vim-textobj-user" })
    use("michaeljsmith/vim-indent-object")
    use("AndrewRadev/splitjoin.vim")

    use("Vimjas/vim-python-pep8-indent")
    use("sophacles/vim-bundle-mako")
    use({ "Glench/Vim-Jinja2-Syntax", opt = true, ft = { "html", "jinja" } })

    -- use({
    --   "sheerun/vim-polyglot",
    --   opt = true,
    --   event = "VimEnter *",
    --   setup = function()
    --     vim.g.polyglot_disabled = { "helm", "python" }
    --   end,
    --   config = function()
    --     vim.g.javascript_plugin_jsdoc = 1
    --     vim.g.vim_markdown_frontmatter = 1
    --     vim.g.vim_markdown_new_list_item_indent = 2
    --   end,
    -- })

    use("vim-test/vim-test")
    -- use("hkupty/iron.nvim")

    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = { python_cmd = "python3" },
})
