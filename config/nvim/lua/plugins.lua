local packer_exists = pcall(vim.cmd, "packadd packer.nvim")
if not packer_exists then
  local directory = vim.fn.stdpath("data") .. "/site/pack/packer/opt/"
  vim.fn.mkdir(directory, "p")
  vim.fn.system {
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    directory .. "/packer.nvim"
  }
  vim.cmd("packadd packer.nvim")
end

require("packer").startup {
  function()
    use {"wbthomason/packer.nvim", opt = true}
    -- use "svermeulen/vimpeccable"

    use {
      "gruvbox-community/gruvbox",
      config = function()
        vim.g.gruvbox_italic = 1
        vim.g.gruvbox_sign_column = "bg0"
        vim.cmd("colorscheme gruvbox") -- must come after gruvbox_italic
        -- match the fold column colors to the line number column
        -- Note: must come after colorscheme gruvbox
        vim.cmd("highlight clear FoldColumn")
        vim.cmd("highlight! link FoldColumn LineNr")

        -- treesitter highlights
        vim.cmd("highlight! link TSConstBuiltin Constant") -- None
        vim.cmd("highlight! link TSKeywordOperator Keyword") -- not, in
        vim.cmd("highlight! link TSOperator GruvboxRed")
        vim.cmd("highlight! link TSFunction GruvboxAqua")
        vim.cmd("highlight! link TSMethod GruvboxAqua")

        ----

        -- vim.cmd("highlight! link TSPunctDelimiter Delimiter") -- , . etc
        -- vim.cmd("highlight! link TSPunctBracket Delimiter")
        -- vim.cmd("highlight! link TSPunctSpecial Delimiter")
        -- vim.cmd("highlight! link TSConstant Constant")
        -- vim.cmd("highlight! link TSConstBuiltin Special") -- None, etc
        -- vim.cmd("highlight! link TSConstMacro Define")
        -- vim.cmd("highlight! link TSString String")
        -- vim.cmd("highlight! link TSStringRegex String")
        -- vim.cmd("highlight! link TSStringEscape SpecialChar")
        -- vim.cmd("highlight! link TSCharacter Character")
        -- vim.cmd("highlight! link TSNumber Number")
        -- vim.cmd("highlight! link TSBoolean Boolean")
        -- vim.cmd("highlight! link TSFloat Float")

        -- vim.cmd("highlight! link TSFunction Function")
        -- vim.cmd("highlight! link TSFuncBuiltin Special") -- print()
        -- vim.cmd("highlight! link TSFuncMacro Macro")
        -- vim.cmd("highlight! link TSParameter Identifier")
        -- vim.cmd("highlight! link TSParameterReference TSParameter")
        -- vim.cmd("highlight! link TSMethod Function")
        -- vim.cmd("highlight! link TSField Identifier")
        -- vim.cmd("highlight! link TSProperty Identifier")
        -- vim.cmd("highlight! link TSConstructor Special") -- __init__()
        -- vim.cmd("highlight! link TSAnnotation PreProc")
        -- vim.cmd("highlight! link TSAttribute PreProc")
        -- vim.cmd("highlight! link TSNamespace Include")

        -- vim.cmd("highlight! link TSConditional Conditional") -- if
        -- vim.cmd("highlight! link TSRepeat Repeat") -- for, while
        -- vim.cmd("highlight! link TSLabel Label")
        -- vim.cmd("highlight! link TSOperator Operator")
        -- vim.cmd("highlight! link TSKeyword Keyword")
        -- vim.cmd("highlight! link TSKeywordFunction Keyword")
        -- vim.cmd("highlight! link TSKeywordOperator Operator") -- not, in
        -- vim.cmd("highlight! link TSException Exception")

        -- vim.cmd("highlight! link TSType Type")
        -- vim.cmd("highlight! link TSTypeBuiltin Type")
        -- vim.cmd("highlight! link TSInclude Include")

        -- vim.cmd("highlight! link TSVariableBuiltin Special") -- self

        -- vim.cmd("highlight! link TSText TSNone")
        -- vim.cmd("highlight! TSStrong term=bold cterm=bold gui=bold")
        -- vim.cmd("highlight! TSEmphasis term=italic cterm=italic gui=italic")
        -- vim.cmd("highlight! TSUnderline term=underline cterm=underline gui=underline")
        -- vim.cmd("highlight! link TSTitle Title")
        -- vim.cmd("highlight! link TSLiteral String")
        -- vim.cmd("highlight! link TSURI Underlined")

        -- vim.cmd("highlight! link TSTag Label")
        -- vim.cmd("highlight! link TSTagDelimiter Delimiter")
      end
    }
    use {
      "romgrk/barbar.nvim",
      requires = "kyazdani42/nvim-web-devicons"
    }
    use {
      "vim-airline/vim-airline",
      requires = "vim-airline/vim-airline-themes",
      config = function()
        vim.g.airline_powerline_fonts = 1
        vim.g.airline_symbols = {
          branch = "",
          readonly = ""
        }
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
        vim.g.envelop_enabled = {"node", "python3"}
        vim.g.envelop_node_link = {
          "node_modules/.bin/luafmt",
          "node_modules/.bin/pyright",
          "node_modules/.bin/pyright-langserver"
        }
        vim.g.envelop_node_packages = {
          "lua-fmt",
          "pyright"
        }
        vim.g.envelop_python3_link = {
          "bin/black",
          "bin/flake8",
          "bin/isort",
          "bin/pip3",
          "bin/pyls",
          "bin/python3",
          "bin/sqlformat",
          "bin/vint"
        }
        vim.g.envelop_python3_packages = {
          "black",
          "flake8",
          "flake8-bugbear",
          "isort",
          "pep8-naming",
          "pip",
          "pyls-black",
          "pyls-isort",
          "pynvim",
          "python-language-server[all]",
          "sqlparse",
          "vim-vint"
        }
      end
    }

    use {
      "neovim/nvim-lspconfig",
      run = ":LspInstall sumneko_lua",
      config = function()
        require("lsp")
        vim.api.nvim_exec(
          [[
            nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
            " nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
            " nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
            " nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
            nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
            " nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
            nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>
            nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
            " nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
            nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>
          ]],
          false
        )
      end
    }
    use {
      "nvim-lua/completion-nvim",
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
        function _G.check_behind()
          local col = vim.fn.col(".") - 1
          local is_empty = function(col)
            return col <= 0 or vim.fn.getline("."):sub(col, col):match("%s")
          end
          return is_empty(col) and is_empty(col - 1) and true or false
        end
        -- TODO: Convert to lua
        vim.api.nvim_exec(
          [[
            " <TAB>/<S-TAB> through completeopts
            inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : v:lua.check_behind() ? "\<TAB>" : completion#trigger_completion()
            inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

            " prevent completion-nvim from conflicting with auto-pairs
            let g:completion_confirm_key = ""
            inoremap <expr> <CR> pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<CR>"
          ]],
          false
        )
      end
    }
    use "pierreglaser/folding-nvim"

    use {
      "mhartington/formatter.nvim",
      config = function()
        require("format").setup {
          javascript = {
            prettier = function()
              return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                stdin = true
              }
            end
          },
          lua = {
            luafmt = function()
              return {
                exe = "luafmt",
                args = {"--indent-count", 2, "--stdin"},
                stdin = true
              }
            end
          }
        }
      end
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSInstall all",
      config = function()
        require("treesitter")
        -- TODO: Still a bit buggy
        -- vim.api.nvim_exec(
        --   [[
        --     set foldmethod=expr
        --     set foldexpr=nvim_treesitter#foldexpr()
        --   ]],
        --   false
        -- )
      end
    }
    -- use {  -- This is rad, but stupid slow right now.
    --   "romgrk/nvim-treesitter-context",
    --   requires = "nvim-treesitter/nvim-treesitter"
    -- }
    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      requires = "nvim-treesitter/nvim-treesitter"
    }
    -- use "nvim-treesitter/nvim-treesitter-refactor"
    -- use {"nvim-treesitter/completion-treesitter", opt = true}
    -- use {
    --   "nvim-treesitter/playground",
    --   requires = "nvim-treesitter/nvim-treesitter"
    -- }

    -- use {
    --   "nvim-telescope/telescope.nvim",
    --   requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
    --   config = function()
    --     vim.api.nvim_exec(
    --       [[
    --         nnoremap <C-p> <cmd>lua require'telescope.builtin'.git_files{}<CR>
    --       ]],
    --       false
    --     )
    --   end
    -- }
    use {
      "junegunn/fzf.vim",
      requires = "/usr/local/opt/fzf",
      opt = true,
      event = "VimEnter *",
      config = function()
        vim.g.fzf_colors = {["bg+"] = {"bg", "Normal"}}
        -- TODO: Convert to lua?
        vim.api.nvim_exec(
          [[
            " mappings
            nnoremap <C-f> :BLines<CR>
            nnoremap <C-b> :Buffers<CR>
            nnoremap <C-c> :Commands<CR>

            " show files in a git project root (or current dir if not project)
            command! ProjectFiles execute 'Files' FindGitRoot()
            nnoremap <C-p> :ProjectFiles<CR>
          ]],
          false
        )
      end
    }

    -- TODO: Switch?
    -- use {
    --   "glepnir/galaxyline.nvim",
    --   branch = "main",
    --   config = function()
    --     require "statusline"
    --   end, -- TODO: Configure
    --   requires = {"kyazdani42/nvim-web-devicons", opt = true},
    --   disable = true
    -- }
    use {"norcalli/nvim-colorizer.lua", opt = true, ft = {"html", "css"}}

    -- use {"ludovicchabant/vim-gutentags", opt = true}
    -- use {"majutsushi/tagbar", opt = true, ft = {"c", "cpp", "typescript", "typescriptreact"}}

    use "romainl/vim-cool"
    use "justinmk/vim-dirvish"
    use "sunaku/tmux-navigate"

    use {"iamcco/markdown-preview.nvim", run = ":call mkdp#util#install()", cmd = "MarkdownPreview"}
    use {
      "kshenoy/vim-signature",
      config = function()
        vim.g.SignatureMarkTextHLDynamic = 1
      end
    }
    use "tpope/vim-unimpaired"
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

    use "wellle/targets.vim"
    use "michaeljsmith/vim-indent-object"
    use "kana/vim-textobj-user"
    use "kana/vim-textobj-line"
    use "AndrewRadev/splitjoin.vim"
    use {
      "mhinz/vim-signify",
      config = function()
        vim.g.signify_priority = 0
        vim.g.signify_sign_add = ""
        vim.g.signify_sign_delete = ""
        vim.g.signify_sign_delete_first_line = ""
        vim.g.signify_sign_change = ""
        vim.api.nvim_exec(
          [[
            set signcolumn=yes
            highlight! link SignifySignChange GruvboxBlueSign

            " nifty hunk motions
            omap ic <Plug>(signify-motion-inner-pending)
            xmap ic <Plug>(signify-motion-inner-visual)
            omap ac <Plug>(signify-motion-outer-pending)
            xmap ac <Plug>(signify-motion-outer-visual)
          ]],
          false
        )
      end
    }
    use {
      "APZelos/blamer.nvim",
      config = function()
        vim.g.blamer_delay = 0
        vim.g.blamer_template = "<author>, <committer-time> • <summary>"
        vim.api.nvim_exec(
          [[
                nnoremap <Leader>b :BlamerToggle<CR>
                vnoremap <Leader>b :BlamerToggle<CR>
                ]],
          false
        )
      end
    }
    use "rhysd/git-messenger.vim"

    use "andymass/vim-matchup"
    use {
      "tmsvg/pear-tree",
      config = function()
        vim.g.pear_tree_repeatable_expand = 0
      end
    }

    use {
      "sheerun/vim-polyglot",
      opt = true,
      event = "VimEnter *",
      config = function()
        vim.g.polyglot_disabled = {"helm", "javascript"}
        vim.g.javascript_plugin_jsdoc = 1
        vim.g.vim_markdown_new_list_item_indent = 2
      end
    }

    use "janko-m/vim-test"
    use "hkupty/iron.nvim"
  end
}
