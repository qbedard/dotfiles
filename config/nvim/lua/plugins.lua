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

  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'nvim-lua/diagnostic-nvim'
  use { 'weilbith/nvim-lsp-diamove', opt = true, cmd = {'Dabove', 'Dbelow'} }
  use 'pierreglaser/folding-nvim'

  use 'mhartington/formatter.nvim'  -- TODO: Configure

  use 'nvim-treesitter/nvim-treesitter'
  -- use { 'nvim-treesitter/completion-treesitter', opt = true, event = 'VimEnter *' }
  -- use 'nvim-treesitter/nvim-treesitter-refactor'
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'romgrk/nvim-treesitter-context'

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require'statusline' end,  -- TODO: Configure
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'romgrk/barbar.nvim'
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
  use 'Yggdroot/indentLine'
  use 'romainl/vim-cool'
  use 'justinmk/vim-dirvish'
  use '/usr/local/opt/fzf'
  use 'junegunn/fzf.vim'
  -- use { 'ludovicchabant/vim-gutentags', opt = true, event = 'VimEnter *'  }
  -- use { 'majutsushi/tagbar', opt = true, ft = {'c', 'cpp', 'typescript', 'typescriptreact'} }
  use { 'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install()', cmd = 'MarkdownPreview' }
  use 'kshenoy/vim-signature'
  use 'tpope/vim-unimpaired'
  use {
    'unblevable/quick-scope',
    config = function() vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'} end
  }
  use 'ntpeters/vim-better-whitespace'
  use 'farmergreg/vim-lastplace'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-abolish'
  use 'AndrewRadev/splitjoin.vim'
  use 'mhinz/vim-signify'
  use 'APZelos/blamer.nvim'
  use 'rhysd/git-messenger.vim'

  --- copied stragglers ---
  use 'andymass/vim-matchup'
  use 'tmsvg/pear-tree'
  -- use 'tpope/vim-apathy'
end)
