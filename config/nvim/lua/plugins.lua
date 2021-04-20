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
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
      end
    }
    -- use {
    --   "gruvbox-community/gruvbox",
    --   config = function()
    --     vim.g.gruvbox_italic = 1
    --     vim.g.gruvbox_sign_column = "bg0"
    --     vim.cmd("colorscheme gruvbox") -- must come after gruvbox_italic
    --     require("tb.gruvbox")
    --   end
    -- }
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
      -- after = {"gruvbox"},
      after = {"gruvbox.nvim"},
      config = function()
        require("lualine").setup {
          sections = {
            lualine_a = {"mode"},
            lualine_b = {
              {"branch", icon = ""}
            },
            lualine_c = {
              {
                "diff",
                symbols = {added = " ", modified = " ", removed = " "}
              },
              {"filename", symbols = {modified = " ", readonly = " "}}
            },
            lualine_x = {
              {
                "diagnostics",
                sources = {"nvim_lsp"},
                color_info = "#83a598",
                symbols = {error = " ", warn = " ", info = " "}
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
        vim.wo.colorcolumn = "80" -- highlight bug hack fix
        vim.g.indent_blankline_char = "│"
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
        utils.map("n", "gD", "<Cmd>lua vim.lsp.buf.definition()<CR>", o)
        utils.map("n", "1gD", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", o)
        -- utils.map("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", o)
        utils.map("n", "g0", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", o)
        utils.map("n", "gf", "<Cmd>lua vim.lsp.buf.formatting()<CR>", o)
      end
    }
    use {
      "glepnir/lspsaga.nvim",
      -- after = "gruvbox",
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
        utils.map("n", "gd", ":Lspsaga preview_definition<CR>", o)
        utils.map("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>", o)
        utils.map("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", o)
        utils.map("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", o)
      end
    }
    use {
      "onsails/lspkind-nvim",
      config = function()
        -- TODO: Improve symbols
        require("lspkind").init {
          symbol_map = {
            Class = "",
            Color = "",
            Constant = "",
            Constructor = "",
            Enum = "",
            EnumMember = "",
            Event = "",
            Field = "𝒙",
            File = "",
            Folder = " ﱮ ",
            Function = "",
            Interface = "⧲",
            Keyword = "",
            Method = "",
            Module = "",
            Operator = "+",
            Property = "",
            Reference = "漏",
            Snippet = "…",
            Struct = "⚎",
            Text = "",
            TypeParameter = "",
            Unit = "塞",
            Value = "",
            Variable = "𝒙"
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
        vim.g["vista#renderer#icons"] = {
          class = "",
          color = "",
          constant = "",
          constructor = "",
          enum = "",
          enummember = "",
          event = "",
          field = "𝒙",
          file = "",
          folder = " ﱮ ",
          ["function"] = "",
          interface = "⧲",
          keyword = "",
          method = "",
          module = "",
          operator = "+",
          property = "",
          reference = "漏",
          snippet = "…",
          struct = "⚎",
          text = "",
          typeparameter = "",
          unit = "塞",
          value = "",
          variable = "𝒙"
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
        vim.g.SignatureMarkTextHLDynamic = 1
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
        require("gitsigns").setup {
          signs = {
            add = {hl = "DiffAdd", text = "┃"},
            change = {hl = "DiffChange", text = "┃"},
            changedelete = {hl = "GruvboxOrange", text = "┃"},
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
        vim.g.matchup_matchparen_offscreen = {method = "popup"}
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

    use {
      "sheerun/vim-polyglot",
      opt = true,
      event = "VimEnter *",
      setup = function()
        vim.g.polyglot_disabled = {"helm"}
      end,
      config = function()
        vim.g.javascript_plugin_jsdoc = 1
        vim.g.vim_markdown_frontmatter = 1
        vim.g.vim_markdown_new_list_item_indent = 2
      end
    }

    use "janko-m/vim-test"
    -- use "hkupty/iron.nvim"
  end,
  config = {
    python_cmd = "python3"
  }
}
