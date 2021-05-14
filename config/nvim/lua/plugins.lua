local packer_path =
  vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_path)) then
  vim.fn.system {
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    packer_path
  }
  vim.cmd("packadd packer.nvim")
end

return require("packer").startup {
  function()
    use {"wbthomason/packer.nvim", opt = true}
    -- use "svermeulen/vimpeccable"

    use {
      "nvim-treesitter/nvim-treesitter",
      requires = {
        -- "romgrk/nvim-treesitter-context", -- This is rad, but stupid slow right now.
        -- "nvim-treesitter/playground",
        -- "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag"
      },
      run = ":TSUpdate",
      config = function()
        require("tb.treesitter")
        -- vim.wo.foldmethod = "expr"
        -- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
      end
    }
    use {
      "npxbr/gruvbox.nvim",
      requires = "rktjmp/lush.nvim",
      config = function()
        vim.g.gruvbox_sign_column = "bg0"
        vim.cmd("colorscheme gruvbox")
        require("tb.gruvbox")
      end
    }
    use {
      "romgrk/barbar.nvim",
      requires = "kyazdani42/nvim-web-devicons"
    }
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons"},
      after = {"gruvbox.nvim"},
      config = function()
        local i = require("tb.icons")

        require("lualine").setup {
          sections = {
            lualine_a = {"mode"},
            lualine_b = {
              {"branch", icon = ""}
            },
            lualine_c = {
              {
                "diff",
                symbols = {
                  added = i.diff.add_,
                  modified = i.diff.mod_,
                  removed = i.diff.del_
                }
              },
              {
                "filename",
                symbols = {modified = i.file._mod, readonly = i.file._lock}
              }
            },
            lualine_x = {
              {
                "diagnostics",
                sources = {"nvim_lsp"},
                color_info = "#83a598",
                symbols = {
                  error = i.diag.error_,
                  warn = i.diag.warn_,
                  info = i.diag.info_,
                  hint = i.diag.hint_
                }
              },
              -- "encoding",
              -- "fileformat",
              "filetype"
            },
            lualine_y = {"progress"},
            lualine_z = {"location"}
          },
          extensions = {"fugitive"}
        }
      end
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      branch = "lua",
      config = function()
        local i = require("tb.icons")

        vim.wo.colorcolumn = "80" -- highlight bug hack fix
        vim.g.indent_blankline_char = i.bar.thin
        vim.g.indent_blankline_buftype_exclude = {"help", "terminal"}
        vim.g.indent_blankline_filetype_exclude = {"text", "markdown"}
        -- vim.g.indent_blankline_show_end_of_line = true
        vim.g.indent_blankline_show_first_indent_level = false
        vim.g.indent_blankline_show_trailing_blankline_indent = false
      end
    }

    use {
      "timbedard/vim-envelop",
      run = ":EnvCreate",
      config = function()
        require("tb.envelop")
      end
    }

    use {
      "sumneko/lua-language-server"
      -- TODO: Get this working.
      -- run = function(plugin)
      --   vim.fn.system(
      --     "cd" .. plugin.path .. " && git submodule update --init --recursive"
      --   )
      --   vim.fn.system(
      --     "cd" ..
      --       plugin.path ..
      --         "/3rd/luamake && ninja -f" ..
      --           string.format("ninja/%s.ninja", string.lower(jit.os))
      --   )
      --   vim.fn.system("cd" .. plugin.path .. "./3rd/luamake/luamake rebuild")

      --   -- local job =
      --   --   vim.fn.jobstart(
      --   --   {"git", "submodule", "update", "--init", "--recursive"},
      --   --   {cwd = plugin.path}
      --   -- )
      --   -- vim.fn.jobwait(job)
      --   -- job =
      --   --   vim.fn.jobstart(
      --   --   {"ninja", "-f", string.format("ninja/%s.ninja", string.lower(jit.os))},
      --   --   {cwd = plugin.path .. "/3rd/luamake"}
      --   -- )
      --   -- vim.fn.jobwait(job)
      --   -- job =
      --   --   vim.fn.jobstart(
      --   --   {"./3rd/luamake/luamake", "rebuild"},
      --   --   {cwd = plugin.path}
      --   -- )
      --   -- vim.fn.jobwait(job)
      -- end
    }

    use {
      "neovim/nvim-lspconfig",
      -- TODO: Get this working
      -- rocks = {"luaformatter", server = "https://luarocks.org/dev"},
      config = function()
        require("tb.lsp")
        local utils = require("tb.utils")
        local o = {silent = true}
        utils.map("n", "<leader>k", "<Cmd>lua vim.lsp.buf.hover()<CR>", o)
        utils.map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", o)
        utils.map("n", "1gd", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", o)
        -- utils.map("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", o)
        utils.map("n", "g0", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", o)
        utils.map("n", "gf", "<Cmd>lua vim.lsp.buf.formatting()<CR>", o)
      end
    }
    use {
      "glepnir/lspsaga.nvim",
      after = "gruvbox.nvim",
      config = function()
        require("tb.lspsaga")

        local utils = require("tb.utils")
        local o = {silent = true}
        utils.map("n", "gh", ":Lspsaga lsp_finder<CR>", o)
        utils.map("n", "<leader>ca", ":Lspsaga code_action<CR>", o)
        -- utils.map("n", "<leader>k", ":Lspsaga hover_doc<CR>", o)
        utils.map("n", "gs", ":Lspsaga signature_help<CR>", o)
        utils.map("n", "gr", ":Lspsaga rename<CR>", o)
        utils.map("n", "gD", ":Lspsaga preview_definition<CR>", o)
        utils.map("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>", o)
        utils.map("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", o)
        utils.map("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", o)
      end
    }
    use {
      "onsails/lspkind-nvim",
      config = function()
        local i = require("tb.icons")

        require("lspkind").init {
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
            Variable = i.lang.variable
          }
        }
      end
    }
    use {
      "hrsh7th/nvim-compe",
      config = function()
        require("compe").setup {
          min_length = 0, -- allow for `from package import _` in Python
          source = {
            -- path = true,
            -- buffer = true,
            nvim_lsp = true,
            nvim_lua = true -- TODO: wtf is this?
          }
        }
        local utils = require("tb.utils")

        local check_behind = function()
          local is_empty = function(col)
            return col <= 0 or vim.fn.getline("."):sub(col, col):match("%s")
          end
          local pos_col = vim.fn.col(".") - 1
          return is_empty(pos_col) and is_empty(pos_col - 1) and true or false
        end

        _G.complete = function(pum, empty)
          if vim.fn.pumvisible() == 1 then
            return utils.term_codes(pum)
          elseif check_behind() then
            return utils.term_codes(empty)
          else
            return vim.fn["compe#complete"]()
          end
        end

        utils.mapx("is", "<Tab>", "v:lua.complete('<C-n>', '<Tab>')")
        utils.mapx("is", "<S-Tab>", "v:lua.complete('<C-p>', '<C-h>')")
        utils.mapx("is", "<C-e>", "compe#close('<C-e>')")

        -- prevent nvim-compe from conflicting with lexima
        vim.g.lexima_no_default_rules = true
        vim.fn["lexima#set_default_rules"]()
        utils.mapx("i", "<CR>", "compe#confirm(lexima#expand('<lt>CR>', 'i'))")
      end
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        local i = require("tb.icons")

        require("trouble").setup {
          signs = {
            error = i.diag.error,
            warning = i.diag.warn,
            hint = i.diag.hint,
            information = i.diag.info,
            other = i.diag.pass
          }
        }
      end
    }

    use "pierreglaser/folding-nvim"

    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-github.nvim"
        -- "nvim-telescope/telescope-packer.nvim"  -- currently breaking packer
      },
      config = function()
        require("tb.telescope")
        vim.api.nvim_set_keymap(
          "n",
          "<Leader><Leader>",
          "<cmd>lua require('telescope.builtin').builtin()<CR>",
          {noremap = true, silent = true}
        )
        vim.api.nvim_set_keymap(
          "n",
          "<C-p>",
          "<cmd>lua require('tb.telescope').project_files()<CR>",
          {noremap = true, silent = true}
        )
        vim.api.nvim_set_keymap(
          "n",
          "<C-b>",
          "<cmd>lua require('telescope.builtin').buffers()<CR>",
          {noremap = true, silent = true}
        )
      end
    }

    use {"norcalli/nvim-colorizer.lua", opt = true, ft = {"css", "html"}}

    use {
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
          variable = i.lang.variable
        }
      end
    }

    use "romainl/vim-cool"
    use {
      "justinmk/vim-dirvish",
      config = function()
        vim.g.loaded_netrwPlugin = 1
      end
    }

    use {
      "iamcco/markdown-preview.nvim",
      run = ":call mkdp#util#install()",
      ft = "markdown"
    }
    use {
      "kshenoy/vim-signature",
      config = function()
        -- only supports vim-gitgutter
        -- vim.g.SignatureMarkTextHLDynamic = 1
      end
    }
    use {
      "unblevable/quick-scope",
      config = function()
        vim.g.qs_highlight_on_keys = {"f", "F", "t", "T"}
      end
    }
    use {
      "ntpeters/vim-better-whitespace",
      config = function()
        vim.g.better_whitespace_enabled = 0
        vim.g.strip_whitelines_at_eof = 1
        vim.cmd("command! Trim StripWhitespace")
      end
    }
    use "farmergreg/vim-lastplace"
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "tpope/vim-eunuch"
    use "tpope/vim-abolish"
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "tpope/vim-unimpaired"

    use "wellle/targets.vim"
    use "michaeljsmith/vim-indent-object"
    use "kana/vim-textobj-user"
    use "kana/vim-textobj-line"
    use "AndrewRadev/splitjoin.vim"

    use {
      "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        local i = require("tb.icons")

        require("gitsigns").setup {
          signs = {
            add = {hl = "DiffAdd", text = i.bar.thick},
            change = {hl = "DiffChange", text = i.bar.thick},
            changedelete = {hl = "GruvboxOrange", text = i.bar.thick},
            delete = {hl = "DiffDelete"},
            topdelete = {hl = "DiffDelete"}
          },
          sign_priority = 0
        }
        vim.wo.signcolumn = "yes"
      end
    }
    use {
      "f-person/git-blame.nvim",
      setup = function()
        vim.g.gitblame_enabled = 0 -- must be set before loading
        vim.g.gitblame_date_format = "%a %b %d %Y"
      end
    }
    use "rhysd/git-messenger.vim"

    use {
      "andymass/vim-matchup",
      config = function()
        vim.g.matchup_matchparen_offscreen = {}
      end
    }
    use {
      "cohama/lexima.vim",
      config = function()
        -- TODO: Fix repeating with .
        -- lexima's <Esc> mapping breaks telescope
        vim.g.lexima_map_escape = ""
      end
    }

    use {
      "Glench/Vim-Jinja2-Syntax",
      opt = true,
      ft = {"html", "jinja"}
    }

    use "Vimjas/vim-python-pep8-indent"

    -- use {
    --   "sheerun/vim-polyglot",
    --   opt = true,
    --   event = "VimEnter *",
    --   setup = function()
    --     vim.g.polyglot_disabled = {"helm", "python"}
    --   end,
    --   config = function()
    --     vim.g.javascript_plugin_jsdoc = 1
    --     vim.g.vim_markdown_frontmatter = 1
    --     vim.g.vim_markdown_new_list_item_indent = 2
    --   end
    -- }

    use "janko-m/vim-test"
    -- use "hkupty/iron.nvim"
  end,
  config = {
    python_cmd = "python3"
  }
}
