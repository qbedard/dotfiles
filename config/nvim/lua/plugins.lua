-- TODO: Fix
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
  local directory = vim.fn.stdpath('data') .. '/site/pack/packer/opt/'
  vim.fn.mkdir(directory, 'p')
  vim.fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim',
  })
end

require('packer').startup(function()

  use { 'wbthomason/packer.nvim', opt = true }
  use 'svermeulen/vimpeccable'

  -- use 'svermeulen/nvim-moonmaker'  -- TODO: This

  use {
    'neovim/nvim-lspconfig',
    config = function() require'lsp' end,
  }
  use {
    'nvim-lua/completion-nvim',
    config = function()
      vim.g.completion_enable_auto_signature = 0  -- crazy slow
      vim.g.completion_chain_complete_list = {
        { complete_items = {'lsp', 'snippet', 'path'} },
        { mode = '<c-p>' },
        { mode = '<c-n>' },
      }
      function _G.check_behind()
        local col = vim.fn.col('.') - 1
        local col_is_empty = function(col)
          return col <= 0 or vim.fn.getline('.'):sub(col, col):match('%s')
        end
        return col_is_empty(col) and col_is_empty(col - 1) and true or false
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
    end,
  }
  use {
    'nvim-lua/diagnostic-nvim',
    config = function()
      vim.g.diagnostic_insert_delay = 1
      vim.g.diagnostic_enable_virtual_text = 1
      vim.g.diagnostic_virtual_text_prefix = ''
      -- TODO: Convert to lua
      vim.api.nvim_exec(
        [[
          sign define LspDiagnosticsErrorSign text=
          sign define LspDiagnosticsWarningSign text=
          sign define LspDiagnosticsInformationSign text=
          sign define LspDiagnosticsHintSign text=➤
        ]],
        false
      )
    end,
  }
  use 'pierreglaser/folding-nvim'
  use { 'weilbith/nvim-lsp-diamove', opt = true, cmd = {'Dabove', 'Dbelow'} }

  use 'mhartington/formatter.nvim'  -- TODO: Configure

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require'treesitter' end,
  }
  -- use { 'nvim-treesitter/completion-treesitter', opt = true, event = 'VimEnter *' }
  -- use 'nvim-treesitter/nvim-treesitter-refactor'
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'romgrk/nvim-treesitter-context'

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require'statusline' end,  -- TODO: Configure
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    disable = true,
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use { 'norcalli/nvim-colorizer.lua', opt = true, ft = {'html', 'css'} }

  --- non-lua ---
  use {
    'gruvbox-community/gruvbox',
    config = function()
      vim.g.gruvbox_italic = 1
      vim.g.gruvbox_sign_column = 'bg0'
      vim.cmd('colorscheme gruvbox')  -- must come after gruvbox_italic
      -- match the fold column colors to the line number column
      -- must come after colorscheme gruvbox
      vim.cmd('highlight clear FoldColumn')
      vim.cmd('highlight! link FoldColumn LineNr')
    end,
  }
  use {
    'vim-airline/vim-airline',
    requires = {'vim-airline/vim-airline-themes', opt = true},
    config = function()
      vim.g.airline_powerline_fonts = 1
      vim.g.airline_symbols = {
        branch = '',
        readonly = '',
      }
    end,
  }

  use {
    'Yggdroot/indentLine',
    config = function()
      vim.g.indentLine_char = '│'
      vim.g.indentLine_bufTypeExclude = {'help', 'terminal'}
      vim.g.indentLine_fileTypeExclude = {'text', 'markdown'}
    end,
  }
  use 'romainl/vim-cool'
  use 'justinmk/vim-dirvish'
  use {
    'junegunn/fzf.vim',
    config = function()
      -- TODO: Find out why this isn't working for floating fzf
      -- don't highlight the current line and selection column
      -- vim.g.fzf_colors = { ['bg+'] = {'bg', 'Normal'} }
      -- TODO: Convert to lua
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
    end,
    requires = {'/usr/local/opt/fzf'},
  }
  -- use { 'ludovicchabant/vim-gutentags', opt = true }
  -- use { 'majutsushi/tagbar', opt = true, ft = {'c', 'cpp', 'typescript', 'typescriptreact'} }
  use { 'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install()', cmd = 'MarkdownPreview' }
  use {
    'kshenoy/vim-signature',
    config = function() vim.g.SignatureMarkTextHLDynamic = 1 end
  }
  use 'tpope/vim-unimpaired'
  use {
    'unblevable/quick-scope',
    config = function() vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'} end
  }
  use {
    'ntpeters/vim-better-whitespace',
    config = function()
      vim.g.better_whitespace_enabled = 0
      vim.g.strip_whitelines_at_eof = 1
      vim.cmd('command! Trim StripWhitespace')
    end,
  }
  use 'farmergreg/vim-lastplace'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-abolish'
  use 'AndrewRadev/splitjoin.vim'
  use {
    'mhinz/vim-signify',
    config = function()
      vim.g.signify_priority = 0
      vim.g.signify_sign_add = ''
      vim.g.signify_sign_delete = ''
      vim.g.signify_sign_delete_first_line = ''
      vim.g.signify_sign_change = ''
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
    end,
  }
  use {
    'APZelos/blamer.nvim',
    config = function()
      vim.g.blamer_delay = 0
      vim.g.blamer_template = '<author>, <committer-time> • <summary>'
      vim.api.nvim_exec(
        [[
          nnoremap <Leader>b :BlamerToggle<CR>
          vnoremap <Leader>b :BlamerToggle<CR>
        ]],
        false
      )
    end,
  }
  use 'rhysd/git-messenger.vim'

  --- copied stragglers ---
  use 'andymass/vim-matchup'
  use 'tmsvg/pear-tree'
  -- use 'tpope/vim-apathy'

end)
