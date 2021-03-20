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
    use {
      "Yggdroot/indentLine",
      config = function()
        vim.g.indentLine_char = "│"
        vim.g.indentLine_bufTypeExclude = {"help", "terminal"}
        vim.g.indentLine_fileTypeExclude = {"text", "markdown"}
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
      requires = "glepnir/lspsaga.nvim",
      config = function()
        require("tb.lsp")
        require("lspsaga").init_lsp_saga {
          use_saga_diagnostic_sign = false,
          -- error_sign = "",
          -- warn_sign = "",
          -- infor_sign = "",
          -- hint_sign = "➤",
          code_action_prompt = {enable = false}
        }

        vim.api.nvim_exec(
          [[
            nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
            nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>
            nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.hover()<CR>
            nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>
            nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
            nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
            nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>
            nnoremap <silent> [d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
            nnoremap <silent> ]d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

            nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

            " nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
            " nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
            " nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
            " nnoremap <silent> <leader>K <cmd>lua vim.lsp.buf.signature_help()<CR>
            " nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
          ]],
          false
        )
      end
    }
    use {
      "nvim-lua/completion-nvim",
      requires = "onsails/lspkind-nvim",
      config = function()
        vim.g.completion_enable_auto_signature = 0 -- crazy slow
        vim.g.completion_chain_complete_list = {
          {
            complete_items = {
              "lsp"
              -- "snippet",
              -- "path"
            }
          },
          {mode = "<c-p>"},
          {mode = "<c-n>"}
        }
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

        local check_behind = function()
          local is_empty = function(col)
            return col <= 0 or vim.fn.getline("."):sub(col, col):match("%s")
          end
          local pos_col = vim.fn.col(".") - 1
          return is_empty(pos_col) and is_empty(pos_col - 1) and true or false
        end

        _G.complete = function(pum, empty)
          if vim.fn.pumvisible() == 1 then
            return vim.api.nvim_replace_termcodes(pum, true, true, true)
          elseif check_behind() then
            return vim.api.nvim_replace_termcodes(empty, true, true, true)
          else
            return vim.fn["completion#trigger_completion"]()
          end
        end

        vim.api.nvim_set_keymap(
          "i",
          "<Tab>",
          "v:lua.complete('<C-n>', '<Tab>')",
          {expr = true, silent = true}
        )
        vim.api.nvim_set_keymap(
          "s",
          "<Tab>",
          "v:lua.complete('<C-n>', '<Tab>')",
          {expr = true, silent = true}
        )
        vim.api.nvim_set_keymap(
          "i",
          "<S-Tab>",
          "v:lua.complete('<C-p>', '<C-h>')",
          {expr = true, silent = true}
        )
        vim.api.nvim_set_keymap(
          "s",
          "<S-Tab>",
          "v:lua.complete('<C-p>', '<C-h>')",
          {expr = true, silent = true}
        )
      end
    }
    -- TODO: Compare to completion-nvim more?
    -- use {
    --   "hrsh7th/nvim-compe",
    --   config = function()
    --     vim.o.completeopt = "menuone,noselect"
    --     require("compe").setup {
    --       enabled = true,
    --       min_length = 0,
    --       source = {
    --         -- path = true,
    --         -- buffer = true,
    --         nvim_lsp = true
    --         -- nvim_lua = true
    --       }
    --     }
    --     function _G.check_behind()
    --       local pos_col = vim.fn.col(".") - 1
    --       local is_empty = function(col)
    --         return col <= 0 or vim.fn.getline("."):sub(col, col):match("%s")
    --       end
    --       return is_empty(pos_col) and is_empty(pos_col - 1) and true or false
    --     end
    --     vim.api.nvim_exec(
    --       [[
    --         " <TAB>/<S-TAB> through completeopts
    --         inoremap <silent><expr> <C-Space> compe#complete()
    --         " inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : v:lua.check_behind() ? "\<TAB>" : compe#complete()
    --         " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    --         " prevent nvim-compe from conflicting with auto-pairs
    --         " inoremap <expr> <CR> pumvisible() ? compe#complete() : "\<CR>"
    --       ]],
    --       false
    --     )
    --   end
    -- }
    use "pierreglaser/folding-nvim"

    use {
      "mhartington/formatter.nvim",
      config = function()
        require("tb.formatter")
        -- Create autocmd for gf map
        local filetypes =
          table.concat(
          {
            "css",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "sh",
            "yaml*"
          },
          ","
        )
        vim.api.nvim_command("augroup format_map")
        vim.api.nvim_command("autocmd!")
        vim.api.nvim_command(
          "autocmd FileType " ..
            filetypes .. " nnoremap <buffer> <silent> gf :Format<CR>"
        )
        vim.api.nvim_command("augroup end")
      end
    }

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
  end
}
