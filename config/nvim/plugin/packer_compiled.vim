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
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["Vim-Jinja2-Syntax"] = {
    loaded = false,
    needs_bufread = false,
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
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nt\0\0\3\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\1\a\0=\1\6\0K\0\1\0\byes\15signcolumn\bopt\bvim\1\0\1\18sign_priority\3\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    after = { "lualine.nvim", "lspsaga.nvim" },
    only_config = true
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÑ\3\0\0\3\0\16\0\0296\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\1'\2\5\0=\2\4\0016\1\2\0009\1\6\0019\2\b\0009\2\t\2=\2\a\0016\1\2\0009\1\6\0015\2\v\0=\2\n\0016\1\2\0009\1\6\0015\2\r\0=\2\f\0016\1\2\0009\1\6\1+\2\1\0=\2\14\0016\1\2\0009\1\6\1+\2\1\0=\2\15\1K\0\1\0004indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\3\0\0\ttext\rmarkdown&indent_blankline_filetype_exclude\1\3\0\0\thelp\rterminal%indent_blankline_buftype_exclude\tthin\bbar\26indent_blankline_char\6g\a80\16colorcolumn\bopt\bvim\rtb.icons\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lexima.vim"] = {
    after = { "nvim-compe" },
    only_config = true
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\nü\6\0\0\6\0:\0W6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\0038\0005\4\6\0009\5\4\0009\5\5\5=\5\a\0049\5\4\0009\5\b\5=\5\t\0049\5\4\0009\5\n\5=\5\v\0049\5\4\0009\5\f\5=\5\r\0049\5\4\0009\5\14\5=\5\15\0049\5\4\0009\5\16\5=\5\17\0049\5\4\0009\5\18\5=\5\19\0049\5\4\0009\5\20\5=\5\21\0049\5\4\0009\5\22\5=\5\23\0049\5\4\0009\5\24\5=\5\25\0049\5\4\0009\5\26\5=\5\27\0049\5\4\0009\5\28\5=\5\29\0049\5\4\0009\5\30\5=\5\31\0049\5\4\0009\5 \5=\5!\0049\5\4\0009\5\"\5=\5#\0049\5\4\0009\5$\5=\5%\0049\5\4\0009\5&\5=\5'\0049\5\4\0009\5(\5=\5)\0049\5\4\0009\5*\5=\5+\0049\5\4\0009\5,\5=\5-\0049\5\4\0009\5.\5=\5/\0049\5\4\0009\0050\5=\0051\0049\5\4\0009\0052\5=\0053\0049\5\4\0009\0054\5=\0055\0049\5\4\0009\0056\5=\0057\4=\0049\3B\1\2\1K\0\1\0\15symbol_map\1\0\0\rVariable\rvariable\nValue\nvalue\tUnit\tunit\18TypeParameter\18typeparameter\tText\ttext\vStruct\vstruct\fSnippet\fsnippet\14Reference\14reference\rProperty\rproperty\rOperator\roperator\vModule\vmodule\vMethod\vmethod\fKeyword\fkeyword\14Interface\14interface\rFunction\rfunction\vFolder\vfolder\tFile\tfile\nField\nfield\nEvent\nevent\15EnumMember\15enummember\tEnum\tenum\16Constructor\16constructor\rConstant\rconstant\nColor\ncolor\nClass\1\0\0\nclass\tlang\tinit\flspkind\rtb.icons\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n§\4\0\0\b\0\22\00086\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0025\1\3\0009\2\4\0'\4\5\0'\5\6\0'\6\a\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\16\0'\6\17\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\18\0'\6\19\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\1K\0\1\0&:Lspsaga diagnostic_jump_next<CR>\a]d&:Lspsaga diagnostic_jump_prev<CR>\a[d':Lspsaga show_line_diagnostics<CR>\15<leader>cd$:Lspsaga preview_definition<CR>\agD\24:Lspsaga rename<CR>\agr :Lspsaga signature_help<CR>\ags\29:Lspsaga code_action<CR>\15<leader>ca\28:Lspsaga lsp_finder<CR>\agh\6n\bmap\1\0\1\vsilent\2\rtb.utils\15tb.lspsaga\frequire\0" },
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
    config = { "\27LJ\2\n∏\5\0\0\t\0001\0E6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3-\0005\4\5\0005\5\4\0=\5\6\0044\5\3\0005\6\a\0>\6\1\5=\5\b\0044\5\3\0005\6\t\0005\a\f\0009\b\n\0009\b\v\b=\b\r\a9\b\n\0009\b\14\b=\b\15\a9\b\n\0009\b\16\b=\b\17\a=\a\18\6>\6\1\0055\6\19\0005\a\22\0009\b\20\0009\b\21\b=\b\15\a9\b\20\0009\b\23\b=\b\24\a=\a\18\6>\6\2\5=\5\25\0045\5'\0005\6\26\0005\a\27\0=\a\28\0065\a\31\0009\b\29\0009\b\30\b=\b \a9\b\29\0009\b!\b=\b\"\a9\b\29\0009\b#\b=\b$\a9\b\29\0009\b%\b=\b&\a=\a\18\6>\6\1\5=\5(\0045\5)\0=\5*\0045\5+\0=\5,\4=\4.\0035\4/\0=\0040\3B\1\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\rsections\1\0\0\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\0\rfiletype\thint\nhint_\tinfo\ninfo_\twarn\nwarn_\nerror\1\0\0\verror_\tdiag\fsources\1\2\0\0\rnvim_lsp\1\2\1\0\16diagnostics\15color_info\f#83a598\14lualine_c\rreadonly\n_lock\1\0\0\t_mod\tfile\1\2\0\0\rfilename\fsymbols\fremoved\tdel_\rmodified\tmod_\nadded\1\0\0\tadd_\tdiff\1\2\0\0\tdiff\14lualine_b\1\2\1\0\vbranch\ticon\bÔêò\14lualine_a\1\0\0\1\2\0\0\tmode\nsetup\flualine\rtb.icons\frequire\0" },
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
    after_files = { "/Users/tim/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n}\0\1\6\0\a\0\22)\1\0\0\2\0\1\0X\1\17Ä6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\5\0\5\1\0223\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2\23\1\0\1\18\2\0\0\18\4\1\0B\2\2\2\15\0\2\0X\3\aÄ\18\2\0\0\23\4\0\1B\2\2\2\15\0\2\0X\3\2Ä+\2\2\0X\3\1Ä+\2\1\0002\0\0ÄL\2\2\0\6.\bcol\afn\bvim\0\2ú\1\0\2\5\2\5\1\0256\2\0\0009\2\1\0029\2\2\2B\2\1\2\t\2\0\0X\2\5Ä-\2\0\0009\2\3\2\18\4\0\0D\2\2\0X\2\rÄ-\2\1\0B\2\1\2\15\0\2\0X\3\5Ä-\2\0\0009\2\3\2\18\4\1\0D\2\2\0X\2\4Ä6\2\0\0009\2\1\0029\2\4\2D\2\1\0K\0\1\0\0¿\1¿\19compe#complete\15term_codes\15pumvisible\afn\bvim\2õ\3\1\0\a\0\22\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0023\1\a\0006\2\b\0003\3\n\0=\3\t\0029\2\v\0'\4\f\0'\5\r\0'\6\14\0B\2\4\0019\2\v\0'\4\f\0'\5\15\0'\6\16\0B\2\4\0019\2\v\0'\4\f\0'\5\17\0'\6\18\0B\2\4\0019\2\v\0'\4\19\0'\5\20\0'\6\21\0B\2\4\0012\0\0ÄK\0\1\0001compe#confirm(lexima#expand('<lt>CR>', 'i'))\t<CR>\6i\25compe#close('<C-e>')\n<C-e>%v:lua.complete('<C-p>', '<C-h>')\f<S-Tab>%v:lua.complete('<C-n>', '<Tab>')\n<Tab>\ais\tmapx\0\rcomplete\a_G\0\rtb.utils\vsource\1\0\2\rnvim_lua\2\rnvim_lsp\2\1\0\1\15min_length\3\0\nsetup\ncompe\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n¢\3\0\0\b\0\16\0&6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0025\1\3\0009\2\4\0'\4\5\0'\5\6\0'\6\a\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1K\0\1\0*<Cmd>lua vim.lsp.buf.formatting()<CR>\agf/<Cmd>lua vim.lsp.buf.document_symbol()<CR>\ag0/<Cmd>lua vim.lsp.buf.type_definition()<CR>\b1gd*<Cmd>lua vim.lsp.buf.definition()<CR>\agd%<Cmd>lua vim.lsp.buf.hover()<CR>\14<leader>k\6n\bmap\1\0\1\vsilent\2\rtb.utils\vtb.lsp\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18tb.treesitter\frequire\0" },
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
  ["specs.nvim"] = {
    config = { "\27LJ\2\nx\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\npopup\1\0\3\nwinhl\15PMenuThumb\nblend\0032\vinc_ms\3\5\1\0\1\rmin_jump\3\20\nsetup\nspecs\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/specs.nvim"
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
    config = { "\27LJ\2\nú\3\0\0\6\0\15\0\0286\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\0028<cmd>lua require('telescope.builtin').buffers()<CR>\n<C-b>\1\0\2\fnoremap\2\vsilent\0029<cmd>lua require('tb.telescope').project_files()<CR>\n<C-p>\1\0\2\fnoremap\2\vsilent\0028<cmd>lua require('telescope.builtin').builtin()<CR>\21<Leader><Leader>\6n\20nvim_set_keymap\bapi\bvim\17tb.telescope\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n◊\1\0\0\6\0\16\0\0276\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\14\0005\4\6\0009\5\4\0009\5\5\5=\5\5\0049\5\4\0009\5\a\5=\5\b\0049\5\4\0009\5\t\5=\5\t\0049\5\4\0009\5\n\5=\5\v\0049\5\4\0009\5\f\5=\5\r\4=\4\15\3B\1\2\1K\0\1\0\nsigns\1\0\0\nother\tpass\16information\tinfo\thint\fwarning\twarn\1\0\0\nerror\tdiag\nsetup\ftrouble\rtb.icons\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\nï\1\0\0\3\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\"command! Trim StripWhitespace\bcmd\28strip_whitelines_at_eof\30better_whitespace_enabled\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-bundle-mako"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-bundle-mako"
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
    config = { "\27LJ\2\n>\0\0\2\0\3\0\0056\0\0\0009\0\1\0004\1\0\0=\1\2\0K\0\1\0!matchup_matchparen_offscreen\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent"
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
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
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
    config = { "\27LJ\2\nÀ\4\0\0\4\0 \0S6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0015\2\a\0009\3\5\0009\3\6\3=\3\6\0029\3\5\0009\3\b\3=\3\b\0029\3\5\0009\3\t\3=\3\t\0029\3\5\0009\3\n\3=\3\n\0029\3\5\0009\3\v\3=\3\v\0029\3\5\0009\3\f\3=\3\f\0029\3\5\0009\3\r\3=\3\r\0029\3\5\0009\3\14\3=\3\14\0029\3\5\0009\3\15\3=\3\15\0029\3\5\0009\3\16\3=\3\16\0029\3\5\0009\3\17\3=\3\17\0029\3\5\0009\3\18\3=\3\18\0029\3\5\0009\3\19\3=\3\19\0029\3\5\0009\3\20\3=\3\20\0029\3\5\0009\3\21\3=\3\21\0029\3\5\0009\3\22\3=\3\22\0029\3\5\0009\3\23\3=\3\23\0029\3\5\0009\3\24\3=\3\24\0029\3\5\0009\3\25\3=\3\25\0029\3\5\0009\3\26\3=\3\26\0029\3\5\0009\3\27\3=\3\27\0029\3\5\0009\3\28\3=\3\28\0029\3\5\0009\3\29\3=\3\29\0029\3\5\0009\3\30\3=\3\30\0029\3\5\0009\3\31\3=\3\31\2=\2\4\1K\0\1\0\rvariable\nvalue\tunit\18typeparameter\ttext\vstruct\fsnippet\14reference\rproperty\roperator\vmodule\vmethod\fkeyword\14interface\rfunction\vfolder\tfile\nfield\nevent\15enummember\tenum\16constructor\rconstant\ncolor\1\0\0\nclass\tlang\25vista#renderer#icons\6g\bvim\rtb.icons\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time("Defining packer_plugins", false)
-- Config for: vista.vim
time("Config for vista.vim", true)
try_loadstring("\27LJ\2\nÀ\4\0\0\4\0 \0S6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0015\2\a\0009\3\5\0009\3\6\3=\3\6\0029\3\5\0009\3\b\3=\3\b\0029\3\5\0009\3\t\3=\3\t\0029\3\5\0009\3\n\3=\3\n\0029\3\5\0009\3\v\3=\3\v\0029\3\5\0009\3\f\3=\3\f\0029\3\5\0009\3\r\3=\3\r\0029\3\5\0009\3\14\3=\3\14\0029\3\5\0009\3\15\3=\3\15\0029\3\5\0009\3\16\3=\3\16\0029\3\5\0009\3\17\3=\3\17\0029\3\5\0009\3\18\3=\3\18\0029\3\5\0009\3\19\3=\3\19\0029\3\5\0009\3\20\3=\3\20\0029\3\5\0009\3\21\3=\3\21\0029\3\5\0009\3\22\3=\3\22\0029\3\5\0009\3\23\3=\3\23\0029\3\5\0009\3\24\3=\3\24\0029\3\5\0009\3\25\3=\3\25\0029\3\5\0009\3\26\3=\3\26\0029\3\5\0009\3\27\3=\3\27\0029\3\5\0009\3\28\3=\3\28\0029\3\5\0009\3\29\3=\3\29\0029\3\5\0009\3\30\3=\3\30\0029\3\5\0009\3\31\3=\3\31\2=\2\4\1K\0\1\0\rvariable\nvalue\tunit\18typeparameter\ttext\vstruct\fsnippet\14reference\rproperty\roperator\vmodule\vmethod\fkeyword\14interface\rfunction\vfolder\tfile\nfield\nevent\15enummember\tenum\16constructor\rconstant\ncolor\1\0\0\nclass\tlang\25vista#renderer#icons\6g\bvim\rtb.icons\frequire\0", "config", "vista.vim")
time("Config for vista.vim", false)
-- Config for: vim-better-whitespace
time("Config for vim-better-whitespace", true)
try_loadstring("\27LJ\2\nï\1\0\0\3\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\"command! Trim StripWhitespace\bcmd\28strip_whitelines_at_eof\30better_whitespace_enabled\6g\bvim\0", "config", "vim-better-whitespace")
time("Config for vim-better-whitespace", false)
-- Config for: vim-dirvish
time("Config for vim-dirvish", true)
try_loadstring("\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23loaded_netrwPlugin\6g\bvim\0", "config", "vim-dirvish")
time("Config for vim-dirvish", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18tb.treesitter\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: trouble.nvim
time("Config for trouble.nvim", true)
try_loadstring("\27LJ\2\n◊\1\0\0\6\0\16\0\0276\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\14\0005\4\6\0009\5\4\0009\5\5\5=\5\5\0049\5\4\0009\5\a\5=\5\b\0049\5\4\0009\5\t\5=\5\t\0049\5\4\0009\5\n\5=\5\v\0049\5\4\0009\5\f\5=\5\r\4=\4\15\3B\1\2\1K\0\1\0\nsigns\1\0\0\nother\tpass\16information\tinfo\thint\fwarning\twarn\1\0\0\nerror\tdiag\nsetup\ftrouble\rtb.icons\frequire\0", "config", "trouble.nvim")
time("Config for trouble.nvim", false)
-- Config for: quick-scope
time("Config for quick-scope", true)
try_loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0", "config", "quick-scope")
time("Config for quick-scope", false)
-- Config for: specs.nvim
time("Config for specs.nvim", true)
try_loadstring("\27LJ\2\nx\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\npopup\1\0\3\nwinhl\15PMenuThumb\nblend\0032\vinc_ms\3\5\1\0\1\rmin_jump\3\20\nsetup\nspecs\frequire\0", "config", "specs.nvim")
time("Config for specs.nvim", false)
-- Config for: vim-matchup
time("Config for vim-matchup", true)
try_loadstring("\27LJ\2\n>\0\0\2\0\3\0\0056\0\0\0009\0\1\0004\1\0\0=\1\2\0K\0\1\0!matchup_matchparen_offscreen\6g\bvim\0", "config", "vim-matchup")
time("Config for vim-matchup", false)
-- Config for: lexima.vim
time("Config for lexima.vim", true)
try_loadstring("\27LJ\2\nà\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\5\0009\0\6\0B\0\1\1K\0\1\0\29lexima#set_default_rules\afn\28lexima_no_default_rules\5\22lexima_map_escape\6g\bvim\0", "config", "lexima.vim")
time("Config for lexima.vim", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\nú\3\0\0\6\0\15\0\0286\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\0028<cmd>lua require('telescope.builtin').buffers()<CR>\n<C-b>\1\0\2\fnoremap\2\vsilent\0029<cmd>lua require('tb.telescope').project_files()<CR>\n<C-p>\1\0\2\fnoremap\2\vsilent\0028<cmd>lua require('telescope.builtin').builtin()<CR>\21<Leader><Leader>\6n\20nvim_set_keymap\bapi\bvim\17tb.telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\n¢\3\0\0\b\0\16\0&6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0025\1\3\0009\2\4\0'\4\5\0'\5\6\0'\6\a\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1K\0\1\0*<Cmd>lua vim.lsp.buf.formatting()<CR>\agf/<Cmd>lua vim.lsp.buf.document_symbol()<CR>\ag0/<Cmd>lua vim.lsp.buf.type_definition()<CR>\b1gd*<Cmd>lua vim.lsp.buf.definition()<CR>\agd%<Cmd>lua vim.lsp.buf.hover()<CR>\14<leader>k\6n\bmap\1\0\1\vsilent\2\rtb.utils\vtb.lsp\frequire\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)
-- Config for: vim-envelop
time("Config for vim-envelop", true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15tb.envelop\frequire\0", "config", "vim-envelop")
time("Config for vim-envelop", false)
-- Config for: gruvbox.nvim
time("Config for gruvbox.nvim", true)
try_loadstring("\27LJ\2\nÄ\1\0\0\3\0\b\0\f6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\0016\0\6\0'\2\a\0B\0\2\1K\0\1\0\15tb.gruvbox\frequire\24colorscheme gruvbox\bcmd\bbg0\24gruvbox_sign_column\6g\bvim\0", "config", "gruvbox.nvim")
time("Config for gruvbox.nvim", false)
-- Config for: which-key.nvim
time("Config for which-key.nvim", true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time("Config for which-key.nvim", false)
-- Config for: vim-signature
time("Config for vim-signature", true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-signature")
time("Config for vim-signature", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\nt\0\0\3\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\1\a\0=\1\6\0K\0\1\0\byes\15signcolumn\bopt\bvim\1\0\1\18sign_priority\3\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
try_loadstring("\27LJ\2\nÑ\3\0\0\3\0\16\0\0296\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\1'\2\5\0=\2\4\0016\1\2\0009\1\6\0019\2\b\0009\2\t\2=\2\a\0016\1\2\0009\1\6\0015\2\v\0=\2\n\0016\1\2\0009\1\6\0015\2\r\0=\2\f\0016\1\2\0009\1\6\1+\2\1\0=\2\14\0016\1\2\0009\1\6\1+\2\1\0=\2\15\1K\0\1\0004indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\3\0\0\ttext\rmarkdown&indent_blankline_filetype_exclude\1\3\0\0\thelp\rterminal%indent_blankline_buftype_exclude\tthin\bbar\26indent_blankline_char\6g\a80\16colorcolumn\bopt\bvim\rtb.icons\frequire\0", "config", "indent-blankline.nvim")
time("Config for indent-blankline.nvim", false)
-- Config for: lspkind-nvim
time("Config for lspkind-nvim", true)
try_loadstring("\27LJ\2\nü\6\0\0\6\0:\0W6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\0038\0005\4\6\0009\5\4\0009\5\5\5=\5\a\0049\5\4\0009\5\b\5=\5\t\0049\5\4\0009\5\n\5=\5\v\0049\5\4\0009\5\f\5=\5\r\0049\5\4\0009\5\14\5=\5\15\0049\5\4\0009\5\16\5=\5\17\0049\5\4\0009\5\18\5=\5\19\0049\5\4\0009\5\20\5=\5\21\0049\5\4\0009\5\22\5=\5\23\0049\5\4\0009\5\24\5=\5\25\0049\5\4\0009\5\26\5=\5\27\0049\5\4\0009\5\28\5=\5\29\0049\5\4\0009\5\30\5=\5\31\0049\5\4\0009\5 \5=\5!\0049\5\4\0009\5\"\5=\5#\0049\5\4\0009\5$\5=\5%\0049\5\4\0009\5&\5=\5'\0049\5\4\0009\5(\5=\5)\0049\5\4\0009\5*\5=\5+\0049\5\4\0009\5,\5=\5-\0049\5\4\0009\5.\5=\5/\0049\5\4\0009\0050\5=\0051\0049\5\4\0009\0052\5=\0053\0049\5\4\0009\0054\5=\0055\0049\5\4\0009\0056\5=\0057\4=\0049\3B\1\2\1K\0\1\0\15symbol_map\1\0\0\rVariable\rvariable\nValue\nvalue\tUnit\tunit\18TypeParameter\18typeparameter\tText\ttext\vStruct\vstruct\fSnippet\fsnippet\14Reference\14reference\rProperty\rproperty\rOperator\roperator\vModule\vmodule\vMethod\vmethod\fKeyword\fkeyword\14Interface\14interface\rFunction\rfunction\vFolder\vfolder\tFile\tfile\nField\nfield\nEvent\nevent\15EnumMember\15enummember\tEnum\tenum\16Constructor\16constructor\rConstant\rconstant\nColor\ncolor\nClass\1\0\0\nclass\tlang\tinit\flspkind\rtb.icons\frequire\0", "config", "lspkind-nvim")
time("Config for lspkind-nvim", false)
-- Load plugins in order defined by `after`
time("Sequenced loading", true)
vim.cmd [[ packadd nvim-compe ]]

-- Config for: nvim-compe
try_loadstring("\27LJ\2\n}\0\1\6\0\a\0\22)\1\0\0\2\0\1\0X\1\17Ä6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\5\0\5\1\0223\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2\23\1\0\1\18\2\0\0\18\4\1\0B\2\2\2\15\0\2\0X\3\aÄ\18\2\0\0\23\4\0\1B\2\2\2\15\0\2\0X\3\2Ä+\2\2\0X\3\1Ä+\2\1\0002\0\0ÄL\2\2\0\6.\bcol\afn\bvim\0\2ú\1\0\2\5\2\5\1\0256\2\0\0009\2\1\0029\2\2\2B\2\1\2\t\2\0\0X\2\5Ä-\2\0\0009\2\3\2\18\4\0\0D\2\2\0X\2\rÄ-\2\1\0B\2\1\2\15\0\2\0X\3\5Ä-\2\0\0009\2\3\2\18\4\1\0D\2\2\0X\2\4Ä6\2\0\0009\2\1\0029\2\4\2D\2\1\0K\0\1\0\0¿\1¿\19compe#complete\15term_codes\15pumvisible\afn\bvim\2õ\3\1\0\a\0\22\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0023\1\a\0006\2\b\0003\3\n\0=\3\t\0029\2\v\0'\4\f\0'\5\r\0'\6\14\0B\2\4\0019\2\v\0'\4\f\0'\5\15\0'\6\16\0B\2\4\0019\2\v\0'\4\f\0'\5\17\0'\6\18\0B\2\4\0019\2\v\0'\4\19\0'\5\20\0'\6\21\0B\2\4\0012\0\0ÄK\0\1\0001compe#confirm(lexima#expand('<lt>CR>', 'i'))\t<CR>\6i\25compe#close('<C-e>')\n<C-e>%v:lua.complete('<C-p>', '<C-h>')\f<S-Tab>%v:lua.complete('<C-n>', '<Tab>')\n<Tab>\ais\tmapx\0\rcomplete\a_G\0\rtb.utils\vsource\1\0\2\rnvim_lua\2\rnvim_lsp\2\1\0\1\15min_length\3\0\nsetup\ncompe\frequire\0", "config", "nvim-compe")

vim.cmd [[ packadd lspsaga.nvim ]]

-- Config for: lspsaga.nvim
try_loadstring("\27LJ\2\n§\4\0\0\b\0\22\00086\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0025\1\3\0009\2\4\0'\4\5\0'\5\6\0'\6\a\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\16\0'\6\17\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\18\0'\6\19\0\18\a\1\0B\2\5\0019\2\4\0'\4\5\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\1K\0\1\0&:Lspsaga diagnostic_jump_next<CR>\a]d&:Lspsaga diagnostic_jump_prev<CR>\a[d':Lspsaga show_line_diagnostics<CR>\15<leader>cd$:Lspsaga preview_definition<CR>\agD\24:Lspsaga rename<CR>\agr :Lspsaga signature_help<CR>\ags\29:Lspsaga code_action<CR>\15<leader>ca\28:Lspsaga lsp_finder<CR>\agh\6n\bmap\1\0\1\vsilent\2\rtb.utils\15tb.lspsaga\frequire\0", "config", "lspsaga.nvim")

vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\n∏\5\0\0\t\0001\0E6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3-\0005\4\5\0005\5\4\0=\5\6\0044\5\3\0005\6\a\0>\6\1\5=\5\b\0044\5\3\0005\6\t\0005\a\f\0009\b\n\0009\b\v\b=\b\r\a9\b\n\0009\b\14\b=\b\15\a9\b\n\0009\b\16\b=\b\17\a=\a\18\6>\6\1\0055\6\19\0005\a\22\0009\b\20\0009\b\21\b=\b\15\a9\b\20\0009\b\23\b=\b\24\a=\a\18\6>\6\2\5=\5\25\0045\5'\0005\6\26\0005\a\27\0=\a\28\0065\a\31\0009\b\29\0009\b\30\b=\b \a9\b\29\0009\b!\b=\b\"\a9\b\29\0009\b#\b=\b$\a9\b\29\0009\b%\b=\b&\a=\a\18\6>\6\1\5=\5(\0045\5)\0=\5*\0045\5+\0=\5,\4=\4.\0035\4/\0=\0040\3B\1\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\rsections\1\0\0\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\0\rfiletype\thint\nhint_\tinfo\ninfo_\twarn\nwarn_\nerror\1\0\0\verror_\tdiag\fsources\1\2\0\0\rnvim_lsp\1\2\1\0\16diagnostics\15color_info\f#83a598\14lualine_c\rreadonly\n_lock\1\0\0\t_mod\tfile\1\2\0\0\rfilename\fsymbols\fremoved\tdel_\rmodified\tmod_\nadded\1\0\0\tadd_\tdiff\1\2\0\0\tdiff\14lualine_b\1\2\1\0\vbranch\ticon\bÔêò\14lualine_a\1\0\0\1\2\0\0\tmode\nsetup\flualine\rtb.icons\frequire\0", "config", "lualine.nvim")

time("Sequenced loading", false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'Vim-Jinja2-Syntax', 'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType jinja ++once lua require("packer.load")({'Vim-Jinja2-Syntax'}, { ft = "jinja" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time("Sourcing ftdetect script at: /Users/tim/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax/ftdetect/jinja.vim", true)
vim.cmd [[source /Users/tim/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax/ftdetect/jinja.vim]]
time("Sourcing ftdetect script at: /Users/tim/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax/ftdetect/jinja.vim", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
