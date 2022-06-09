local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  })
  vim.cmd("packadd packer.nvim")
end

-- require("packer.luarocks").install_commands()

return require("packer").startup({
  function(use)
    use({ "wbthomason/packer.nvim" })

    use({
      "nvim-treesitter/nvim-treesitter",
      requires = {
        -- "romgrk/nvim-treesitter-context", -- This is rad, but stupid slow right now.
        -- "nvim-treesitter/playground",
        -- "nvim-treesitter/nvim-treesitter-refactor",
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
        vim.g.gruvbox_sign_column = "bg0"
        vim.cmd("colorscheme gruvbox")

        -- require("tb.gruvbox")  -- for ref, but inline works on PackerCompile

        -- general
        vim.cmd("highlight! link Operator GruvboxRed")
        vim.cmd("highlight! link Function GruvboxAqua")
        vim.cmd("highlight! link Method GruvboxAqua")

        -- treesitter
        vim.cmd("highlight! link TSOperator GruvboxRed")
        vim.cmd("highlight! link TSFunction GruvboxAqua")
        vim.cmd("highlight! link TSMethod GruvboxAqua")
        vim.cmd("highlight! link TSConstBuiltin Constant") -- None

        -- misc
        vim.cmd("highlight! link DiffChange GruvboxBlue") -- for gitsigns
      end,
    })
    use({
      "Murtaza-Udaipurwala/gruvqueen",
      config = function()
        -- require("gruvqueen").setup {
        --   config = {
        --     invert_selection = true,
        --     style = "original",
        --     -- transparent_background = true
        --   },
        --   palette = {
        --     bg1 = "#282828",
        --     grey0 = "#7c6f64"
        --   }
        -- }
        -- vim.cmd("colorscheme gruvqueen")
      end,
    })

    use({
      "akinsho/bufferline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      after = { "gruvbox.nvim", "gruvqueen" },
      config = function()
        local bufferline = require("bufferline")
        local colors = require("bufferline.colors")
        local hex = colors.get_color
        local shade = colors.shade_color

        local normal_bg = hex({ name = "Normal", attribute = "bg" })
        local separator_background_color = shade(normal_bg, -27)
        local background_color = shade(normal_bg, -18)

        bufferline.setup({
          highlights = {
            buffer_selected = { gui = "bold" },
            background = { guibg = background_color },
            fill = { guibg = separator_background_color },
            indicator_selected = {
              guifg = { attribute = "fg", highlight = "GruvboxBlue" },
            },
            separator = {
              guifg = separator_background_color,
              guibg = background_color,
            },
            tab = { guibg = background_color },
            tab_close = { guibg = background_color },
            close_button = { guibg = background_color },
            modified = { guibg = background_color },
          },
          options = {
            always_show_bufferline = false,
            enforce_regular_tabs = true,
            -- modified_icon = require("tb.icons").file.mod,
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
      requires = { "kyazdani42/nvim-web-devicons" },
      after = { "gruvbox.nvim", "gruvqueen" },
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
    --   "famiu/feline.nvim",
    --   after = { "gruvbox.nvim", "gruvqueen" },
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
        vim.opt.colorcolumn = "80" -- highlight bug hack fix
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

    use({
      "edluffy/specs.nvim",
      config = function()
        -- vim.cmd("highlight SpecsWinHl guibg=#1D2021")
        require("specs").setup({
          min_jump = 20,
          popup = {
            inc_ms = 5,
            blend = 50,
            winhl = "PMenuThumb",
            -- winhl = "SpecsWinHl"
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

    use({
      "neovim/nvim-lspconfig",
      config = function()
        require("tb.lsp")
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
        vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]g", vim.diagnostic.goto_next)

        vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)
        vim.keymap.set("n", "<leader>s", vim.lsp.buf.signature_help)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "1gd", vim.lsp.buf.type_definition)
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references)
        vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol)
        vim.keymap.set("n", "gf", vim.lsp.buf.format)

        vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action)
      end,
    })

    use({
      -- "jose-elias-alvarez/null-ls.nvim",
      "timbedard/null-ls.nvim",
      branch = "add-sql-formatter",
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
          formatting = {
            format = function(entry, vim_item)
              vim_item.kind = lspkind.presets.default[vim_item.kind]
              return vim_item
            end,
          },
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

    -- use({
    --   "folke/which-key.nvim",
    --   config = function()
    --     require("which-key").setup({})
    --   end,
    -- })

    -- use({
    --   -- not maintained :(
    --   -- "norcalli/nvim-colorizer.lua",
    --   "timbedard/nvim-colorizer.lua",
    --   opt = true,
    --   ft = { "css", "scss", "html" },
    --   config = function()
    --     -- TODO: Fix this in nvim-colorizer.lua
    --     -- require("colorizer").setup({ default_options = { mode = "virtualtext" } })
    --     require("colorizer").setup({
    --       css = { mode = "virtualtext" },
    --       scss = { mode = "virtualtext" },
    --     })
    --   end,
    -- })

    use({ "gorodinskiy/vim-coloresque" })

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
      config = function()
        -- local i = require("tb.icons")

        require("gitsigns").setup({
          -- TODO: maybe change this now that gruvbox.nvim highlights have changed
          -- signs = {
          --   add = {hl = "DiffAdd", text = i.bar.thick},
          --   change = {hl = "DiffChange", text = i.bar.thick},
          --   changedelete = {hl = "GruvboxOrange", text = i.bar.thick},
          --   delete = {hl = "DiffDelete"},
          --   topdelete = {hl = "DiffDelete"}
          -- },
          sign_priority = 0,
        })
        vim.opt.signcolumn = "yes"
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

    use("tpope/vim-abolish")
    use("tpope/vim-commentary")
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

    use("janko-m/vim-test")
    -- use("hkupty/iron.nvim")

    -- TODO: Make sure this works.
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = { python_cmd = "python3" },
})
