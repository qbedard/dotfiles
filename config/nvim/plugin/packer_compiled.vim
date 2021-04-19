" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["Vim-Jinja2-Syntax"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["folding-nvim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/folding-nvim"
  },
  ["git-blame.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/git-blame.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\0016\0\16\0009\0\17\0'\1\19\0=\1\18\0K\0\1\0\byes\15signcolumn\awo\bvim\nsigns\1\0\1\18sign_priority\3\0\14topdelete\1\0\1\ahl\15DiffDelete\vdelete\1\0\1\ahl\15DiffDelete\17changedelete\1\0\2\ttext\b┃\ahl\18GruvboxOrange\vchange\1\0\2\ttext\b┃\ahl\15DiffChange\badd\1\0\0\1\0\2\ttext\b┃\ahl\fDiffAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    after = { "lspsaga.nvim", "lualine.nvim" },
    only_config = true
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\2\0\r\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\1\6\0=\1\5\0006\0\0\0009\0\4\0005\1\b\0=\1\a\0006\0\0\0009\0\4\0005\1\n\0=\1\t\0006\0\0\0009\0\4\0+\1\1\0=\1\v\0006\0\0\0009\0\4\0+\1\1\0=\1\f\0K\0\1\0004indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\3\0\0\ttext\rmarkdown&indent_blankline_filetype_exclude\1\3\0\0\thelp\rterminal%indent_blankline_buftype_exclude\b│\26indent_blankline_char\6g\a80\16colorcolumn\awo\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lexima.vim"] = {
    config = { "\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\5\22lexima_map_escape\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15symbol_map\1\0\0\1\0\25\rConstant\b\tText\b\nEvent\b\vStruct\b⚎\tFile\b\fSnippet\b…\tUnit\b塞\14Reference\b漏\nValue\b\rProperty\b\rVariable\t𝒙\rOperator\6+\vModule\b\vMethod\b\fKeyword\b\14Interface\b⧲\rFunction\b\vFolder\n ﱮ \16Constructor\b\nField\t𝒙\nColor\b\15EnumMember\b\nClass\b\tEnum\b\18TypeParameter\b\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\b\0\22\00086\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0025\1\3\0009\2\4\0'\4\5\0'\5\6\0'\6\a\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\16\0'\6\17\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\18\0'\6\19\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\1K\0\1\0&:Lspsaga diagnostic_jump_next<CR>\a]d&:Lspsaga diagnostic_jump_prev<CR>\a[d':Lspsaga show_line_diagnostics<CR>\15<leader>cd$:Lspsaga preview_definition<CR>\agd\24:Lspsaga rename<CR>\agr :Lspsaga signature_help<CR>\ags\29:Lspsaga code_action<CR>\15<leader>ca\28:Lspsaga lsp_finder<CR>\agh\6n\bmap\1\0\1\vsilent\2\rtb.utils\15tb.lspsaga\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["lua-language-server"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lua-language-server"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\a\0\27\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\23\0005\3\4\0005\4\3\0=\4\5\0034\4\3\0005\5\6\0>\5\1\4=\4\a\0035\4\v\0005\5\b\0005\6\t\0=\6\n\5>\5\1\4=\4\f\0035\4\17\0005\5\r\0005\6\14\0=\6\15\0055\6\16\0=\6\n\5>\5\1\4=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\24\0025\3\25\0=\3\26\2B\0\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\rsections\1\0\0\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\0\rfiletype\1\0\3\tinfo\t \nerror\t \twarn\t \fsources\1\2\0\0\rnvim_lsp\1\2\1\0\16diagnostics\15color_info\f#83a598\14lualine_c\1\3\0\0\0\rfilename\fsymbols\1\0\3\nadded\t \fremoved\t \rmodified\t \1\2\0\0\tdiff\14lualine_b\1\2\1\0\vbranch\ticon\b\14lualine_a\1\0\0\1\2\0\0\tmode\nsetup\flualine\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n}\0\1\6\0\a\0\22)\1\0\0\2\0\1\0X\1\17�6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2X\2\3�+\1\1\0X\2\1�+\1\2\0L\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\5\0\5\1\0223\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2\23\1\0\1\18\2\0\0\18\4\1\0B\2\2\2\15\0\2\0X\3\a�\18\2\0\0\23\4\0\1B\2\2\2\15\0\2\0X\3\2�+\2\2\0X\3\1�+\2\1\0002\0\0�L\2\2\0\6.\bcol\afn\bvim\0\2�\1\0\2\5\2\5\1\0256\2\0\0009\2\1\0029\2\2\2B\2\1\2\t\2\0\0X\2\5�-\2\0\0009\2\3\2\18\4\0\0D\2\2\0X\2\r�-\2\1\0B\2\1\2\15\0\2\0X\3\5�-\2\0\0009\2\3\2\18\4\1\0D\2\2\0X\2\4�6\2\0\0009\2\1\0029\2\4\2D\2\1\0K\0\1\0\0�\1�\19compe#complete\15term_codes\15pumvisible\afn\bvim\2�\3\1\0\a\0\27\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0023\1\a\0006\2\b\0003\3\n\0=\3\t\0029\2\v\0'\4\f\0'\5\r\0'\6\14\0B\2\4\0019\2\v\0'\4\f\0'\5\15\0'\6\16\0B\2\4\0019\2\v\0'\4\f\0'\5\17\0'\6\18\0B\2\4\0016\2\19\0009\2\20\2+\3\2\0=\3\21\0026\2\19\0009\2\22\0029\2\23\2B\2\1\0019\2\v\0'\4\24\0'\5\25\0'\6\26\0B\2\4\0012\0\0�K\0\1\0001compe#confirm(lexima#expand('<lt>CR>', 'i'))\t<CR>\6i\29lexima#set_default_rules\afn\28lexima_no_default_rules\6g\bvim\25compe#close('<C-e>')\n<C-e>%v:lua.complete('<C-p>', '<C-h>')\f<S-Tab>%v:lua.complete('<C-n>', '<Tab>')\n<Tab>\ais\tmapx\0\rcomplete\a_G\0\rtb.utils\vsource\1\0\2\rnvim_lsp\2\rnvim_lua\2\1\0\1\15min_length\3\0\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n�\3\0\0\b\0\16\0&6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0025\1\3\0009\2\4\0'\4\5\0'\5\6\0'\6\a\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1K\0\1\0*<Cmd>lua vim.lsp.buf.formatting()<CR>\agf/<Cmd>lua vim.lsp.buf.document_symbol()<CR>\ag0/<Cmd>lua vim.lsp.buf.type_definition()<CR>\b1gD*<Cmd>lua vim.lsp.buf.definition()<CR>\agD%<Cmd>lua vim.lsp.buf.hover()<CR>\14<leader>k\6n\bmap\1\0\1\vsilent\2\rtb.utils\vtb.lsp\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\b\0\f6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\2\0009\0\3\0'\1\a\0=\1\6\0K\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\awo\bvim\18tb.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\15\0\0286\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\0028<cmd>lua require('telescope.builtin').buffers()<CR>\n<C-b>\1\0\2\fnoremap\2\vsilent\0029<cmd>lua require('tb.telescope').project_files()<CR>\n<C-p>\1\0\2\fnoremap\2\vsilent\0028<cmd>lua require('telescope.builtin').builtin()<CR>\21<Leader><Leader>\6n\20nvim_set_keymap\bapi\bvim\17tb.telescope\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\"command! Trim StripWhitespace\bcmd\28strip_whitelines_at_eof\30better_whitespace_enabled\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-dirvish"] = {
    config = { "\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23loaded_netrwPlugin\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-envelop"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15tb.envelop\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-envelop"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-polyglot"] = {
    config = { "\27LJ\2\n�\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\2\0=\1\4\0K\0\1\0&vim_markdown_new_list_item_indent\29vim_markdown_frontmatter\28javascript_plugin_jsdoc\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-signature"] = {
    config = { "\27LJ\2\n<\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\31SignatureMarkTextHLDynamic\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\n�\2\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\25\roperator\6+\vmethod\b\fkeyword\b\14interface\b⧲\vfolder\n ﱮ \tfile\b\nevent\b\15enummember\b\tenum\b\16constructor\b\rfunction\b\ncolor\b\nclass\b\rconstant\b\ttext\b\vmodule\b\nfield\t𝒙\rvariable\t𝒙\nvalue\b\tunit\b塞\18typeparameter\b\vstruct\b⚎\fsnippet\b…\14reference\b漏\rproperty\b\25vista#renderer#icons\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

-- Setup for: vim-polyglot
try_loadstring("\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\thelm\22polyglot_disabled\6g\bvim\0", "setup", "vim-polyglot")
-- Setup for: git-blame.nvim
try_loadstring("\27LJ\2\nc\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\16%a %b %d %Y\25gitblame_date_format\21gitblame_enabled\6g\bvim\0", "setup", "git-blame.nvim")
vim.cmd [[packadd git-blame.nvim]]
-- Config for: vim-envelop
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15tb.envelop\frequire\0", "config", "vim-envelop")
-- Config for: gitsigns.nvim
try_loadstring("\27LJ\2\n�\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\0016\0\16\0009\0\17\0'\1\19\0=\1\18\0K\0\1\0\byes\15signcolumn\awo\bvim\nsigns\1\0\1\18sign_priority\3\0\14topdelete\1\0\1\ahl\15DiffDelete\vdelete\1\0\1\ahl\15DiffDelete\17changedelete\1\0\2\ttext\b┃\ahl\18GruvboxOrange\vchange\1\0\2\ttext\b┃\ahl\15DiffChange\badd\1\0\0\1\0\2\ttext\b┃\ahl\fDiffAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
-- Config for: telescope.nvim
try_loadstring("\27LJ\2\n�\3\0\0\6\0\15\0\0286\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\0028<cmd>lua require('telescope.builtin').buffers()<CR>\n<C-b>\1\0\2\fnoremap\2\vsilent\0029<cmd>lua require('tb.telescope').project_files()<CR>\n<C-p>\1\0\2\fnoremap\2\vsilent\0028<cmd>lua require('telescope.builtin').builtin()<CR>\21<Leader><Leader>\6n\20nvim_set_keymap\bapi\bvim\17tb.telescope\frequire\0", "config", "telescope.nvim")
-- Config for: vim-matchup
try_loadstring("\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "config", "vim-matchup")
-- Config for: lexima.vim
try_loadstring("\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\5\22lexima_map_escape\6g\bvim\0", "config", "lexima.vim")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\n�\1\0\0\3\0\b\0\f6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\2\0009\0\3\0'\1\a\0=\1\6\0K\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\awo\bvim\18tb.treesitter\frequire\0", "config", "nvim-treesitter")
-- Config for: vim-signature
try_loadstring("\27LJ\2\n<\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\31SignatureMarkTextHLDynamic\6g\bvim\0", "config", "vim-signature")
-- Config for: nvim-compe
try_loadstring("\27LJ\2\n}\0\1\6\0\a\0\22)\1\0\0\2\0\1\0X\1\17�6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2X\2\3�+\1\1\0X\2\1�+\1\2\0L\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\5\0\5\1\0223\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2\23\1\0\1\18\2\0\0\18\4\1\0B\2\2\2\15\0\2\0X\3\a�\18\2\0\0\23\4\0\1B\2\2\2\15\0\2\0X\3\2�+\2\2\0X\3\1�+\2\1\0002\0\0�L\2\2\0\6.\bcol\afn\bvim\0\2�\1\0\2\5\2\5\1\0256\2\0\0009\2\1\0029\2\2\2B\2\1\2\t\2\0\0X\2\5�-\2\0\0009\2\3\2\18\4\0\0D\2\2\0X\2\r�-\2\1\0B\2\1\2\15\0\2\0X\3\5�-\2\0\0009\2\3\2\18\4\1\0D\2\2\0X\2\4�6\2\0\0009\2\1\0029\2\4\2D\2\1\0K\0\1\0\0�\1�\19compe#complete\15term_codes\15pumvisible\afn\bvim\2�\3\1\0\a\0\27\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0023\1\a\0006\2\b\0003\3\n\0=\3\t\0029\2\v\0'\4\f\0'\5\r\0'\6\14\0B\2\4\0019\2\v\0'\4\f\0'\5\15\0'\6\16\0B\2\4\0019\2\v\0'\4\f\0'\5\17\0'\6\18\0B\2\4\0016\2\19\0009\2\20\2+\3\2\0=\3\21\0026\2\19\0009\2\22\0029\2\23\2B\2\1\0019\2\v\0'\4\24\0'\5\25\0'\6\26\0B\2\4\0012\0\0�K\0\1\0001compe#confirm(lexima#expand('<lt>CR>', 'i'))\t<CR>\6i\29lexima#set_default_rules\afn\28lexima_no_default_rules\6g\bvim\25compe#close('<C-e>')\n<C-e>%v:lua.complete('<C-p>', '<C-h>')\f<S-Tab>%v:lua.complete('<C-n>', '<Tab>')\n<Tab>\ais\tmapx\0\rcomplete\a_G\0\rtb.utils\vsource\1\0\2\rnvim_lsp\2\rnvim_lua\2\1\0\1\15min_length\3\0\nsetup\ncompe\frequire\0", "config", "nvim-compe")
-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\n�\3\0\0\b\0\16\0&6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0025\1\3\0009\2\4\0'\4\5\0'\5\6\0'\6\a\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1K\0\1\0*<Cmd>lua vim.lsp.buf.formatting()<CR>\agf/<Cmd>lua vim.lsp.buf.document_symbol()<CR>\ag0/<Cmd>lua vim.lsp.buf.type_definition()<CR>\b1gD*<Cmd>lua vim.lsp.buf.definition()<CR>\agD%<Cmd>lua vim.lsp.buf.hover()<CR>\14<leader>k\6n\bmap\1\0\1\vsilent\2\rtb.utils\vtb.lsp\frequire\0", "config", "nvim-lspconfig")
-- Config for: vim-dirvish
try_loadstring("\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23loaded_netrwPlugin\6g\bvim\0", "config", "vim-dirvish")
-- Config for: indent-blankline.nvim
try_loadstring("\27LJ\2\n�\2\0\0\2\0\r\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\1\6\0=\1\5\0006\0\0\0009\0\4\0005\1\b\0=\1\a\0006\0\0\0009\0\4\0005\1\n\0=\1\t\0006\0\0\0009\0\4\0+\1\1\0=\1\v\0006\0\0\0009\0\4\0+\1\1\0=\1\f\0K\0\1\0004indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\3\0\0\ttext\rmarkdown&indent_blankline_filetype_exclude\1\3\0\0\thelp\rterminal%indent_blankline_buftype_exclude\b│\26indent_blankline_char\6g\a80\16colorcolumn\awo\bvim\0", "config", "indent-blankline.nvim")
-- Config for: vista.vim
try_loadstring("\27LJ\2\n�\2\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\25\roperator\6+\vmethod\b\fkeyword\b\14interface\b⧲\vfolder\n ﱮ \tfile\b\nevent\b\15enummember\b\tenum\b\16constructor\b\rfunction\b\ncolor\b\nclass\b\rconstant\b\ttext\b\vmodule\b\nfield\t𝒙\rvariable\t𝒙\nvalue\b\tunit\b塞\18typeparameter\b\vstruct\b⚎\fsnippet\b…\14reference\b漏\rproperty\b\25vista#renderer#icons\6g\bvim\0", "config", "vista.vim")
-- Config for: gruvbox.nvim
try_loadstring("\27LJ\2\n�\1\0\0\3\0\b\0\f6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\0016\0\6\0'\2\a\0B\0\2\1K\0\1\0\15tb.gruvbox\frequire\24colorscheme gruvbox\bcmd\bbg0\24gruvbox_sign_column\6g\bvim\0", "config", "gruvbox.nvim")
-- Config for: quick-scope
try_loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0", "config", "quick-scope")
-- Config for: vim-better-whitespace
try_loadstring("\27LJ\2\n�\1\0\0\3\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\"command! Trim StripWhitespace\bcmd\28strip_whitelines_at_eof\30better_whitespace_enabled\6g\bvim\0", "config", "vim-better-whitespace")
-- Config for: lspkind-nvim
try_loadstring("\27LJ\2\n�\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15symbol_map\1\0\0\1\0\25\rConstant\b\tText\b\nEvent\b\vStruct\b⚎\tFile\b\fSnippet\b…\tUnit\b塞\14Reference\b漏\nValue\b\rProperty\b\rVariable\t𝒙\rOperator\6+\vModule\b\vMethod\b\fKeyword\b\14Interface\b⧲\rFunction\b\vFolder\n ﱮ \16Constructor\b\nField\t𝒙\nColor\b\15EnumMember\b\nClass\b\tEnum\b\18TypeParameter\b\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
-- Load plugins in order defined by `after`
vim.cmd [[ packadd lspsaga.nvim ]]

-- Config for: lspsaga.nvim
try_loadstring("\27LJ\2\n�\4\0\0\b\0\22\00086\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0025\1\3\0009\2\4\0'\4\5\0'\5\6\0'\6\a\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\16\0'\6\17\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\18\0'\6\19\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\1K\0\1\0&:Lspsaga diagnostic_jump_next<CR>\a]d&:Lspsaga diagnostic_jump_prev<CR>\a[d':Lspsaga show_line_diagnostics<CR>\15<leader>cd$:Lspsaga preview_definition<CR>\agd\24:Lspsaga rename<CR>\agr :Lspsaga signature_help<CR>\ags\29:Lspsaga code_action<CR>\15<leader>ca\28:Lspsaga lsp_finder<CR>\agh\6n\bmap\1\0\1\vsilent\2\rtb.utils\15tb.lspsaga\frequire\0", "config", "lspsaga.nvim")

vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\n�\3\0\0\a\0\27\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\23\0005\3\4\0005\4\3\0=\4\5\0034\4\3\0005\5\6\0>\5\1\4=\4\a\0035\4\v\0005\5\b\0005\6\t\0=\6\n\5>\5\1\4=\4\f\0035\4\17\0005\5\r\0005\6\14\0=\6\15\0055\6\16\0=\6\n\5>\5\1\4=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\24\0025\3\25\0=\3\26\2B\0\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\rsections\1\0\0\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\0\rfiletype\1\0\3\tinfo\t \nerror\t \twarn\t \fsources\1\2\0\0\rnvim_lsp\1\2\1\0\16diagnostics\15color_info\f#83a598\14lualine_c\1\3\0\0\0\rfilename\fsymbols\1\0\3\nadded\t \fremoved\t \rmodified\t \1\2\0\0\tdiff\14lualine_b\1\2\1\0\vbranch\ticon\b\14lualine_a\1\0\0\1\2\0\0\tmode\nsetup\flualine\frequire\0", "config", "lualine.nvim")

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType html ++once lua require("packer.load")({'Vim-Jinja2-Syntax', 'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType jinja ++once lua require("packer.load")({'Vim-Jinja2-Syntax'}, { ft = "jinja" }, _G.packer_plugins)]]
  -- Event lazy-loads
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-polyglot'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
vim.cmd [[source /Users/tim/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax/ftdetect/jinja.vim]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
