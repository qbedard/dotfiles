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
  ["blamer.nvim"] = {
    config = { "\27LJ\2\nä\2\0\0\4\0\b\0\0156\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0009\0\6\0'\2\a\0+\3\1\0B\0\3\1K\0\1\0q            nnoremap <Leader>b :BlamerToggle<CR>\n            vnoremap <Leader>b :BlamerToggle<CR>\n          \14nvim_exec\bapi-<author>, <committer-time> ‚Ä¢ <summary>\20blamer_template\17blamer_delay\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/blamer.nvim"
  },
  ["completion-nvim"] = {
    config = { "\27LJ\2\n}\0\1\6\0\a\0\22)\1\0\0\2\0\1\0X\1\17Ä6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\5\0\5\1\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0003\1\4\0\18\2\1\0\18\4\0\0B\2\2\2\15\0\2\0X\3\aÄ\18\2\1\0\23\4\0\0B\2\2\2\15\0\2\0X\3\2Ä+\2\2\0X\3\1Ä+\2\1\0002\0\0ÄL\2\2\0\0\6.\bcol\afn\bvim\2€\t\1\0\4\0\21\0\"6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0004\1\4\0005\2\5\0005\3\4\0=\3\6\2>\2\1\0015\2\a\0>\2\2\0015\2\b\0>\2\3\1=\1\3\0006\0\t\0'\2\n\0B\0\2\0029\0\v\0005\2\r\0005\3\f\0=\3\14\2B\0\2\0016\0\15\0003\1\17\0=\1\16\0006\0\0\0009\0\18\0009\0\19\0'\2\20\0+\3\1\0B\0\3\1K\0\1\0È\4            \" <TAB>/<S-TAB> through completeopts\n            inoremap <silent> <expr> <TAB> pumvisible() ? \"\\<C-n>\" : v:lua.check_behind() ? \"\\<TAB>\" : completion#trigger_completion()\n            inoremap <silent> <expr> <S-TAB> pumvisible() ? \"\\<C-p>\" : v:lua.check_behind() ? \"\\<S-TAB>\" : completion#trigger_completion()\n\n            \" prevent completion-nvim from conflicting with auto-pairs plugins\n            let g:completion_confirm_key = \"\"\n            inoremap <expr> <CR> pumvisible() ? complete_info()[\"selected\"] != \"-1\" ? \"\\<Plug>(completion_confirm_completion)\" : \"\\<c-e>\\<CR>\" : \"\\<CR>\"\n          \14nvim_exec\bapi\0\17check_behind\a_G\15symbol_map\1\0\0\1\0\25\fSnippet\b‚Ä¶\rProperty\bÓò§\vStruct\b‚öé\rOperator\6+\vModule\5\vMethod\bÔö¶\tText\bÓòí\fKeyword\bÔê£\18TypeParameter\bÔûÉ\14Interface\b‚ß≤\rFunction\bÔö¶\tUnit\bÔ•¨\vFolder\bÔÑï\nValue\bÔô©\tFile\bÔÖõ\nField\tùíô\rVariable\tùíô\nEvent\bÔÉß\15EnumMember\bÔëë\tEnum\bÔëë\16Constructor\bÔö¶\rConstant\bÓà¨\nColor\bÓà´\nClass\bÔÉ®\14Reference\bÔ•é\tinit\flspkind\frequire\1\0\1\tmode\n<c-n>\1\0\1\tmode\n<c-p>\19complete_items\1\0\0\1\2\0\0\blsp#completion_chain_complete_list%completion_enable_auto_signature\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["folding-nvim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/folding-nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nÿ\2\0\0\6\0\14\0 6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0005\2\4\0'\3\5\0B\0\3\0026\1\6\0009\1\a\0019\1\b\1'\3\t\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\n\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\v\0\18\4\0\0'\5\f\0&\3\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\r\0B\1\2\1K\0\1\0\16augroup end/ nnoremap <buffer> <silent> gf :Format<CR>\22autocmd FileType \rautocmd!\23augroup format_map\17nvim_command\bapi\bvim\6,\1\t\0\0\bcss\thtml\15javascript\tjson\blua\rmarkdown\ash\nyaml*\vconcat\ntable\17tb.formatter\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n›\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\0016\0\16\0009\0\17\0'\1\19\0=\1\18\0K\0\1\0\byes\15signcolumn\awo\bvim\nsigns\1\0\0\17changedelete\1\0\2\ahl\22GruvboxOrangeSign\ttext\6~\14topdelete\1\0\2\ahl\19GruvboxRedSign\ttext\b‚Äæ\vdelete\1\0\2\ahl\19GruvboxRedSign\ttext\6_\vchange\1\0\2\ahl\20GruvboxBlueSign\ttext\b‚îÇ\badd\1\0\0\1\0\2\ahl\21GruvboxGreenSign\ttext\b‚îÇ\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15tb.gruvbox\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  indentLine = {
    config = { "\27LJ\2\nÆ\1\0\0\2\0\b\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0K\0\1\0\1\3\0\0\ttext\rmarkdown\31indentLine_fileTypeExclude\1\3\0\0\thelp\rterminal\30indentLine_bufTypeExclude\b‚îÇ\20indentLine_char\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lexima.vim"] = {
    config = { "\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\5\22lexima_map_escape\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-language-server"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lua-language-server"
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
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nà\v\0\0\4\0\v\0\0186\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0005\2\5\0005\3\4\0=\3\6\2B\0\2\0016\0\a\0009\0\b\0009\0\t\0'\2\n\0+\3\1\0B\0\3\1K\0\1\0‰\t            nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>\n            nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>\n            nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.hover()<CR>\n            nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>\n            nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>\n            nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>\n            nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>\n            nnoremap <silent> [d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>\n            nnoremap <silent> ]d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>\n\n            \" TODO: Get working\n            nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>\n\n            \" nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>\n            \" nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>\n            \" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>\n            \" nnoremap <silent> <leader>K <cmd>lua vim.lsp.buf.signature_help()<CR>\n            \" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>\n          \14nvim_exec\bapi\bvim\23code_action_prompt\1\0\0\1\0\1\venable\1\18init_lsp_saga\flspsaga\vtb.lsp\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nà\1\0\0\3\0\b\0\f6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\2\0009\0\3\0'\1\a\0=\1\6\0K\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\awo\bvim\18tb.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
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
    config = { "\27LJ\2\nú\3\0\0\6\0\15\0\0286\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\0028<cmd>lua require('telescope.builtin').buffers()<CR>\n<C-b>\1\0\2\vsilent\2\fnoremap\0029<cmd>lua require('tb.telescope').project_files()<CR>\n<C-p>\1\0\2\vsilent\2\fnoremap\0028<cmd>lua require('telescope.builtin').builtin()<CR>\21<Leader><Leader>\6n\20nvim_set_keymap\bapi\bvim\17tb.telescope\frequire\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-airline"] = {
    config = { "\27LJ\2\n9\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\28airline_powerline_fonts\6g\bvim\0" },
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\nï\1\0\0\3\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\"command! Trim StripWhitespace\bcmd\28strip_whitelines_at_eof\30better_whitespace_enabled\6g\bvim\0" },
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
    config = { "\27LJ\2\nk\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\2\0=\1\3\0K\0\1\0&vim_markdown_new_list_item_indent\28javascript_plugin_jsdoc\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-repeat"
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
    loaded = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

-- Setup for: vim-polyglot
try_loadstring("\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\thelm\22polyglot_disabled\6g\bvim\0", "setup", "vim-polyglot")
-- Config for: vim-airline
try_loadstring("\27LJ\2\n9\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\28airline_powerline_fonts\6g\bvim\0", "config", "vim-airline")
-- Config for: formatter.nvim
try_loadstring("\27LJ\2\nÿ\2\0\0\6\0\14\0 6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0005\2\4\0'\3\5\0B\0\3\0026\1\6\0009\1\a\0019\1\b\1'\3\t\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\n\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\v\0\18\4\0\0'\5\f\0&\3\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\r\0B\1\2\1K\0\1\0\16augroup end/ nnoremap <buffer> <silent> gf :Format<CR>\22autocmd FileType \rautocmd!\23augroup format_map\17nvim_command\bapi\bvim\6,\1\t\0\0\bcss\thtml\15javascript\tjson\blua\rmarkdown\ash\nyaml*\vconcat\ntable\17tb.formatter\frequire\0", "config", "formatter.nvim")
-- Config for: completion-nvim
try_loadstring("\27LJ\2\n}\0\1\6\0\a\0\22)\1\0\0\2\0\1\0X\1\17Ä6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\5\0\5\1\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0003\1\4\0\18\2\1\0\18\4\0\0B\2\2\2\15\0\2\0X\3\aÄ\18\2\1\0\23\4\0\0B\2\2\2\15\0\2\0X\3\2Ä+\2\2\0X\3\1Ä+\2\1\0002\0\0ÄL\2\2\0\0\6.\bcol\afn\bvim\2€\t\1\0\4\0\21\0\"6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0004\1\4\0005\2\5\0005\3\4\0=\3\6\2>\2\1\0015\2\a\0>\2\2\0015\2\b\0>\2\3\1=\1\3\0006\0\t\0'\2\n\0B\0\2\0029\0\v\0005\2\r\0005\3\f\0=\3\14\2B\0\2\0016\0\15\0003\1\17\0=\1\16\0006\0\0\0009\0\18\0009\0\19\0'\2\20\0+\3\1\0B\0\3\1K\0\1\0È\4            \" <TAB>/<S-TAB> through completeopts\n            inoremap <silent> <expr> <TAB> pumvisible() ? \"\\<C-n>\" : v:lua.check_behind() ? \"\\<TAB>\" : completion#trigger_completion()\n            inoremap <silent> <expr> <S-TAB> pumvisible() ? \"\\<C-p>\" : v:lua.check_behind() ? \"\\<S-TAB>\" : completion#trigger_completion()\n\n            \" prevent completion-nvim from conflicting with auto-pairs plugins\n            let g:completion_confirm_key = \"\"\n            inoremap <expr> <CR> pumvisible() ? complete_info()[\"selected\"] != \"-1\" ? \"\\<Plug>(completion_confirm_completion)\" : \"\\<c-e>\\<CR>\" : \"\\<CR>\"\n          \14nvim_exec\bapi\0\17check_behind\a_G\15symbol_map\1\0\0\1\0\25\fSnippet\b‚Ä¶\rProperty\bÓò§\vStruct\b‚öé\rOperator\6+\vModule\5\vMethod\bÔö¶\tText\bÓòí\fKeyword\bÔê£\18TypeParameter\bÔûÉ\14Interface\b‚ß≤\rFunction\bÔö¶\tUnit\bÔ•¨\vFolder\bÔÑï\nValue\bÔô©\tFile\bÔÖõ\nField\tùíô\rVariable\tùíô\nEvent\bÔÉß\15EnumMember\bÔëë\tEnum\bÔëë\16Constructor\bÔö¶\rConstant\bÓà¨\nColor\bÓà´\nClass\bÔÉ®\14Reference\bÔ•é\tinit\flspkind\frequire\1\0\1\tmode\n<c-n>\1\0\1\tmode\n<c-p>\19complete_items\1\0\0\1\2\0\0\blsp#completion_chain_complete_list%completion_enable_auto_signature\6g\bvim\0", "config", "completion-nvim")
-- Config for: gruvbox
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15tb.gruvbox\frequire\0", "config", "gruvbox")
-- Config for: vim-dirvish
try_loadstring("\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23loaded_netrwPlugin\6g\bvim\0", "config", "vim-dirvish")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\nà\1\0\0\3\0\b\0\f6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\2\0009\0\3\0'\1\a\0=\1\6\0K\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\awo\bvim\18tb.treesitter\frequire\0", "config", "nvim-treesitter")
-- Config for: vim-matchup
try_loadstring("\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "config", "vim-matchup")
-- Config for: vim-envelop
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15tb.envelop\frequire\0", "config", "vim-envelop")
-- Config for: vim-signature
try_loadstring("\27LJ\2\n<\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\31SignatureMarkTextHLDynamic\6g\bvim\0", "config", "vim-signature")
-- Config for: gitsigns.nvim
try_loadstring("\27LJ\2\n›\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\0016\0\16\0009\0\17\0'\1\19\0=\1\18\0K\0\1\0\byes\15signcolumn\awo\bvim\nsigns\1\0\0\17changedelete\1\0\2\ahl\22GruvboxOrangeSign\ttext\6~\14topdelete\1\0\2\ahl\19GruvboxRedSign\ttext\b‚Äæ\vdelete\1\0\2\ahl\19GruvboxRedSign\ttext\6_\vchange\1\0\2\ahl\20GruvboxBlueSign\ttext\b‚îÇ\badd\1\0\0\1\0\2\ahl\21GruvboxGreenSign\ttext\b‚îÇ\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\nà\v\0\0\4\0\v\0\0186\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0005\2\5\0005\3\4\0=\3\6\2B\0\2\0016\0\a\0009\0\b\0009\0\t\0'\2\n\0+\3\1\0B\0\3\1K\0\1\0‰\t            nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>\n            nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>\n            nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.hover()<CR>\n            nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>\n            nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>\n            nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>\n            nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>\n            nnoremap <silent> [d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>\n            nnoremap <silent> ]d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>\n\n            \" TODO: Get working\n            nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>\n\n            \" nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>\n            \" nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>\n            \" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>\n            \" nnoremap <silent> <leader>K <cmd>lua vim.lsp.buf.signature_help()<CR>\n            \" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>\n          \14nvim_exec\bapi\bvim\23code_action_prompt\1\0\0\1\0\1\venable\1\18init_lsp_saga\flspsaga\vtb.lsp\frequire\0", "config", "nvim-lspconfig")
-- Config for: vim-better-whitespace
try_loadstring("\27LJ\2\nï\1\0\0\3\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\"command! Trim StripWhitespace\bcmd\28strip_whitelines_at_eof\30better_whitespace_enabled\6g\bvim\0", "config", "vim-better-whitespace")
-- Config for: quick-scope
try_loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0", "config", "quick-scope")
-- Config for: indentLine
try_loadstring("\27LJ\2\nÆ\1\0\0\2\0\b\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0K\0\1\0\1\3\0\0\ttext\rmarkdown\31indentLine_fileTypeExclude\1\3\0\0\thelp\rterminal\30indentLine_bufTypeExclude\b‚îÇ\20indentLine_char\6g\bvim\0", "config", "indentLine")
-- Config for: blamer.nvim
try_loadstring("\27LJ\2\nä\2\0\0\4\0\b\0\0156\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0009\0\6\0'\2\a\0+\3\1\0B\0\3\1K\0\1\0q            nnoremap <Leader>b :BlamerToggle<CR>\n            vnoremap <Leader>b :BlamerToggle<CR>\n          \14nvim_exec\bapi-<author>, <committer-time> ‚Ä¢ <summary>\20blamer_template\17blamer_delay\6g\bvim\0", "config", "blamer.nvim")
-- Config for: telescope.nvim
try_loadstring("\27LJ\2\nú\3\0\0\6\0\15\0\0286\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\0028<cmd>lua require('telescope.builtin').buffers()<CR>\n<C-b>\1\0\2\vsilent\2\fnoremap\0029<cmd>lua require('tb.telescope').project_files()<CR>\n<C-p>\1\0\2\vsilent\2\fnoremap\0028<cmd>lua require('telescope.builtin').builtin()<CR>\21<Leader><Leader>\6n\20nvim_set_keymap\bapi\bvim\17tb.telescope\frequire\0", "config", "telescope.nvim")
-- Config for: lexima.vim
try_loadstring("\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\5\22lexima_map_escape\6g\bvim\0", "config", "lexima.vim")
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua', 'Vim-Jinja2-Syntax'}, { ft = "html" }, _G.packer_plugins)]]
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
