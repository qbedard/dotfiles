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
        -- "nvim-treesitter/completion-treesitter",
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
    use {
      "gruvbox-community/gruvbox",
      config = function()
        require("tb.gruvbox")
      end
    }
    use {
      "romgrk/barbar.nvim",
      requires = "kyazdani42/nvim-web-devicons"
    }
    -- TODO: Replace
    use {
      "vim-airline/vim-airline",
      requires = "vim-airline/vim-airline-themes",
      config = function()
        vim.g.airline_powerline_fonts = 1
        -- TODO: Find out wtf is going on with airline
        -- vim.g.airline_symbols = {
        --   branch = "",
        --   readonly = ""
        -- }
      end
    }
    -- use {
    --   "tjdevries/express_line.nvim",
    --   config = function()
    --   end
    -- }

    use {
      "Yggdroot/indentLine",
      config = function()
        vim.g.indentLine_char = "│"
        vim.g.indentLine_bufTypeExclude = {"help", "terminal"}
        vim.g.indentLine_fileTypeExclude = {"text", "markdown"}
      end
    }
    -- use {
    --   "lukas-reineke/indent-blankline.nvim",
    --   branch = "lua",
    --   config = function()
    --     vim.g.indent_blankline_char = "│"
    --     vim.g.indent_blankline_buftype_exclude = {"help", "terminal"}
    --     vim.g.indent_blankline_filetype_exclude = {"text", "markdown"}
    --     -- vim.g.indent_blankline_show_end_of_line = true
    --     vim.g.indent_blankline_show_first_indent_level = false
    --     vim.g.indent_blankline_show_trailing_blankline_indent = false
    --   end
    -- }

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
      config = function()
        require("lspsaga").init_lsp_saga {
          use_saga_diagnostic_sign = false,
          -- error_sign = "",
          -- warn_sign = "",
          -- infor_sign = "",
          -- hint_sign = "➤",
          code_action_prompt = {enable = false}
        }

        vim.cmd("highlight! link DiagnosticHint GruvboxAqua")
        vim.cmd("highlight! link DiagnosticInformation GruvboxBlue")
        vim.cmd("highlight! link DiagnosticTruncateLine GruvboxGray")
        vim.cmd("highlight! link LspDiagnosticsFloatingError Error")
        vim.cmd("highlight! link LspDiagnosticsFloatingWarn WarningMsg")
        vim.cmd("highlight! link LspDiagnosticsFloatingInfor GruvboxBlue")
        vim.cmd("highlight! link LspDiagnosticsFloatingHint GruvboxAqua")
        vim.cmd("highlight! link LspSagaAutoPreview GruvboxFg3")
        vim.cmd("highlight! link LspSagaBorderTitle GruvboxOrangeBold")
        vim.cmd("highlight! link LspSagaCodeActionBorder GruvboxFg2")
        vim.cmd("highlight! link LspSagaCodeActionContent GruvboxAquaBold")
        vim.cmd("highlight! link LspSagaCodeActionTitle GruvboxOrangeBold")
        vim.cmd("highlight! link LspSagaCodeActionTruncateLine GruvboxGray")
        vim.cmd("highlight! link LspSagaDefPreviewBorder GruvboxFg2")
        vim.cmd("highlight! link LspSagaDiagnosticBorder GruvboxPurple")
        vim.cmd("highlight! link LspSagaDiagnosticHeader GruvboxFg3")
        vim.cmd("highlight! link LspSagaDiagnosticTruncateLine GruvboxPurple")
        vim.cmd("highlight! link LspSagaDocTruncateLine GruvboxGray")
        vim.cmd("highlight! link LspSagaFinderSelection GruvboxGreenBold")
        vim.cmd("highlight! link LspSagaHoverBorder GruvboxBlue")
        vim.cmd("highlight! link LspSagaLspFinderBorder GruvboxBlue")
        vim.cmd("highlight! link LspSagaRenameBorder GruvboxBlue")
        vim.cmd("highlight! link LspSagaRenamePromptPrefix GruvboxAqua")
        vim.cmd("highlight! link LspSagaShTruncateLine GruvboxGray")
        vim.cmd("highlight! link LspSagaSignatureHelpBorder GruvboxAqua")
        vim.cmd("highlight! link ProviderTruncateLine GruvboxGray")
        vim.cmd("highlight! link SagaShadow GruvboxBg1")
        vim.cmd("highlight! link TargetWord GruvboxRed")

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
    -- use {
    --   "nvim-lua/completion-nvim",
    --   config = function()
    --     vim.g.completion_enable_auto_signature = 0 -- crazy slow
    --     vim.g.completion_chain_complete_list = {
    --       {
    --         complete_items = {
    --           "lsp"
    --           -- "snippet",
    --           -- "path"
    --         }
    --       },
    --       {mode = "<c-p>"},
    --       {mode = "<c-n>"}
    --     }
    --     local term_codes = function(s)
    --       return vim.api.nvim_replace_termcodes(s, true, true, true)
    --     end

    --     local check_behind = function()
    --       local is_empty = function(col)
    --         return col <= 0 or vim.fn.getline("."):sub(col, col):match("%s")
    --       end
    --       local pos_col = vim.fn.col(".") - 1
    --       return is_empty(pos_col) and is_empty(pos_col - 1) and true or false
    --     end

    --     _G.complete = function(pum, empty)
    --       if vim.fn.pumvisible() == 1 then
    --         return term_codes(pum)
    --       elseif check_behind() then
    --         return term_codes(empty)
    --       else
    --         return vim.fn["completion#trigger_completion"]()
    --       end
    --     end

    --     vim.api.nvim_set_keymap(
    --       "i",
    --       "<Tab>",
    --       "v:lua.complete('<C-n>', '<Tab>')",
    --       {expr = true, noremap = true, silent = true}
    --     )
    --     vim.api.nvim_set_keymap(
    --       "s",
    --       "<Tab>",
    --       "v:lua.complete('<C-n>', '<Tab>')",
    --       {expr = true, noremap = true, silent = true}
    --     )
    --     vim.api.nvim_set_keymap(
    --       "i",
    --       "<S-Tab>",
    --       "v:lua.complete('<C-p>', '<C-h>')",
    --       {expr = true, noremap = true, silent = true}
    --     )
    --     vim.api.nvim_set_keymap(
    --       "s",
    --       "<S-Tab>",
    --       "v:lua.complete('<C-p>', '<C-h>')",
    --       {expr = true, noremap = true, silent = true}
    --     )

    --     -- prevent completion from conflicting with pairing plugin
    --     vim.g.completion_confirm_key = ""
    --     vim.api.nvim_exec(
    --       [[
    --         inoremap <expr> <CR> pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)" : "\<c-e>\<CR>" : "\<CR>"
    --       ]],
    --       false
    --     )
    --     -- _G.confirm_complete = function()
    --     --   if vim.fn.pumvisible() ~= 1 then
    --     --     return term_codes("<CR>")
    --     --   elseif vim.fn["complete_info"]()["selected"] == -1 then
    --     --     return term_codes("<C-e><CR>")
    --     --   else
    --     --     return vim.fn["completion#completion_confirm"]()
    --     --   end
    --     -- end
    --     -- vim.api.nvim_set_keymap(
    --     --   "i",
    --     --   "<CR>",
    --     --   "v:lua.confirm_complete()",
    --     --   {expr = true, noremap = true, silent = true}
    --     -- )
    --   end
    -- }
    use {
      "hrsh7th/nvim-compe",
      config = function()
        require("compe").setup {
          min_length = 0, -- allow for `from package import _` in Python
          source = {
            -- path = true,
            -- buffer = true,
            nvim_lsp = true
            -- nvim_lua = true -- TODO: wtf is this?
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

    -- use {
    --   "mhartington/formatter.nvim",
    --   config = function()
    --     require("tb.formatter")
    --     -- Create autocmd for gf map
    --     local filetypes =
    --       table.concat(
    --       {
    --         "css",
    --         "html",
    --         "javascript",
    --         "json",
    --         "lua",
    --         "markdown",
    --         "sh",
    --         "yaml*"
    --       },
    --       ","
    --     )
    --     vim.api.nvim_command("augroup format_map")
    --     vim.api.nvim_command("autocmd!")
    --     vim.api.nvim_command(
    --       "autocmd FileType " ..
    --         filetypes .. " nnoremap <buffer> <silent> gf :Format<CR>"
    --     )
    --     vim.api.nvim_command("augroup end")
    --   end
    -- }

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
            add = {
              hl = "GruvboxGreenSign"
              -- text = "▎"
            },
            change = {
              hl = "GruvboxBlueSign"
              -- text = "▎"
            },
            delete = {
              hl = "GruvboxRedSign"
              -- text = "_"
            },
            topdelete = {
              hl = "GruvboxRedSign"
              -- text = "‾"
            },
            changedelete = {
              hl = "GruvboxOrangeSign",
              text = "│"
            }
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
    -- use {
    --   "tmsvg/pear-tree",
    --   config = function()
    --     -- pear-tree's imaps break telescope
    --     vim.g.pear_tree_ft_disabled = {"TelescopePrompt"}
    --     vim.g.pear_tree_repeatable_expand = 0
    --   end
    -- }
    use {
      "cohama/lexima.vim",
      config = function()
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
