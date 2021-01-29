" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif
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

_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["blamer.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\b\0\0156\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0009\0\6\0'\2\a\0+\3\1\0B\0\3\1K\0\1\0q            nnoremap <Leader>b :BlamerToggle<CR>\n            vnoremap <Leader>b :BlamerToggle<CR>\n          \14nvim_exec\bapi-<author>, <committer-time> • <summary>\20blamer_template\17blamer_delay\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/blamer.nvim"
  },
  ["completion-nvim"] = {
    config = { "\27LJ\2\n}\0\1\6\0\a\0\22)\1\0\0\2\0\1\0X\1\17�6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2X\2\3�+\1\1\0X\2\1�+\1\2\0L\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\5\0\5\1\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0003\1\4\0\18\2\1\0\18\4\0\0B\2\2\2\15\0\2\0X\3\a�\18\2\1\0\23\4\0\0B\2\2\2\15\0\2\0X\3\2�+\2\2\0X\3\1�+\2\1\0002\0\0�L\2\2\0\0\6.\bcol\afn\bvim\2�\6\1\0\4\0\15\0\0266\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0004\1\4\0005\2\5\0005\3\4\0=\3\6\2>\2\1\0015\2\a\0>\2\2\0015\2\b\0>\2\3\1=\1\3\0006\0\t\0003\1\v\0=\1\n\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0+\3\1\0B\0\3\1K\0\1\0�\4            \" <TAB>/<S-TAB> through completeopts\n            inoremap <silent> <expr> <TAB> pumvisible() ? \"\\<C-n>\" : v:lua.check_behind() ? \"\\<TAB>\" : completion#trigger_completion()\n            \" inoremap <expr> <S-TAB> pumvisible() ? \"\\<C-p>\" : \"\\<S-TAB>\"\n\n            \" prevent completion-nvim from conflicting with auto-pairs plugins\n            let g:completion_confirm_key = \"\"\n            inoremap <expr> <CR> pumvisible() ? complete_info()[\"selected\"] != \"-1\" ? \"\\<Plug>(completion_confirm_completion)\" : \"\\<c-e>\\<CR>\" : \"\\<CR>\"\n          \14nvim_exec\bapi\0\17check_behind\a_G\1\0\1\tmode\n<c-n>\1\0\1\tmode\n<c-p>\19complete_items\1\0\0\1\2\0\0\blsp#completion_chain_complete_list%completion_enable_auto_signature\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["folding-nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/folding-nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\14\0 6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0005\2\4\0'\3\5\0B\0\3\0026\1\6\0009\1\a\0019\1\b\1'\3\t\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\n\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\v\0\18\4\0\0'\5\f\0&\3\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\r\0B\1\2\1K\0\1\0\16augroup end/ nnoremap <buffer> <silent> gf :Format<CR>\22autocmd FileType \rautocmd!\23augroup format_map\17nvim_command\bapi\bvim\6,\1\t\0\0\bcss\thtml\15javascript\tjson\blua\rmarkdown\ash\nyaml*\vconcat\ntable\17tb.formatter\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  gruvbox = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15tb.gruvbox\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  indentLine = {
    config = { "\27LJ\2\n�\1\0\0\2\0\b\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0K\0\1\0\1\3\0\0\ttext\rmarkdown\31indentLine_fileTypeExclude\1\3\0\0\thelp\rterminal\30indentLine_bufTypeExclude\b│\20indentLine_char\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lexima.vim"] = {
    config = { "\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\5\22lexima_map_escape\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-language-server"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/lua-language-server"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n�\v\0\0\4\0\t\0\0166\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0005\2\4\0B\0\2\0016\0\5\0009\0\6\0009\0\a\0'\2\b\0+\3\1\0B\0\3\1K\0\1\0�\t            nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>\n            nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>\n            nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.hover()<CR>\n            nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>\n            nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>\n            nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>\n            nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>\n            nnoremap <silent> [d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>\n            nnoremap <silent> ]d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>\n\n            \" TODO: Get working\n            nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>\n\n            \" nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>\n            \" nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>\n            \" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>\n            \" nnoremap <silent> <leader>K <cmd>lua vim.lsp.buf.signature_help()<CR>\n            \" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>\n          \14nvim_exec\bapi\bvim\1\0\4\15infor_sign\b\14warn_sign\b\14hint_sign\b➤\15error_sign\b\18init_lsp_saga\flspsaga\vtb.lsp\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18tb.treesitter\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\15\0\0286\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\0028<cmd>lua require('telescope.builtin').buffers()<CR>\n<C-b>\1\0\2\vsilent\2\fnoremap\0029<cmd>lua require('tb.telescope').project_files()<CR>\n<C-p>\1\0\2\vsilent\2\fnoremap\0028<cmd>lua require('telescope.builtin').builtin()<CR>\21<Leader><Leader>\6n\20nvim_set_keymap\bapi\bvim\17tb.telescope\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-airline"] = {
    config = { "\27LJ\2\n9\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\28airline_powerline_fonts\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\"command! Trim StripWhitespace\bcmd\28strip_whitelines_at_eof\30better_whitespace_enabled\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-commentary"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-cool"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-dirvish"] = {
    config = { "\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23loaded_netrwPlugin\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-envelop"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15tb.envelop\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-envelop"
  },
  ["vim-eunuch"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-indent-object"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-lastplace"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  ["vim-matchup"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-polyglot"] = {
    config = { "\27LJ\2\nk\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\2\0=\1\3\0K\0\1\0&vim_markdown_new_list_item_indent\28javascript_plugin_jsdoc\6g\bvim\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-signature"] = {
    config = { "\27LJ\2\n<\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\31SignatureMarkTextHLDynamic\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-signify"] = {
    config = { "\27LJ\2\n�\4\0\0\4\0\r\0\0276\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\6\0=\1\a\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\n\0009\0\v\0'\2\f\0+\3\1\0B\0\3\1K\0\1\0�\2            set signcolumn=yes\n            highlight! link SignifySignChange GruvboxBlueSign\n\n            \" nifty hunk motions\n            omap ic <Plug>(signify-motion-inner-pending)\n            xmap ic <Plug>(signify-motion-inner-visual)\n            omap ac <Plug>(signify-motion-outer-pending)\n            xmap ac <Plug>(signify-motion-outer-visual)\n          \14nvim_exec\bapi\b\24signify_sign_change#signify_sign_delete_first_line\b\24signify_sign_delete\b\21signify_sign_add\21signify_priority\6g\bvim\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-surround"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vista.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = packer_plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

local packer_load = nil
local function handle_after(name, before)
  local plugin = packer_plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    packer_load({name}, {})
  end
end

packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if packer_plugins[name].commands then
      for _, cmd in ipairs(packer_plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if packer_plugins[name].keys then
      for _, key in ipairs(packer_plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if packer_plugins[name].config then
        for _i, config_line in ipairs(packer_plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if packer_plugins[name].after then
        for _, after_name in ipairs(packer_plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      packer_plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    local escaped_keys = vim.api.nvim_replace_termcodes(cause.keys .. extra, true, true, true)
    vim.api.nvim_feedkeys(escaped_keys, 'm', true)
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

_packer_load_wrapper = function(names, cause)
  success, err_msg = pcall(packer_load, names, cause)
  if not success then
    vim.cmd('echohl ErrorMsg')
    vim.cmd('echomsg "Error in packer_compiled: ' .. vim.fn.escape(err_msg, '"') .. '"')
    vim.cmd('echomsg "Please check your config for correctness"')
    vim.cmd('echohl None')
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Setup for: vim-polyglot
loadstring("\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\thelm\22polyglot_disabled\6g\bvim\0")()
-- Post-load configuration
-- Config for: lexima.vim
loadstring("\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\5\22lexima_map_escape\6g\bvim\0")()
-- Config for: indentLine
loadstring("\27LJ\2\n�\1\0\0\2\0\b\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0K\0\1\0\1\3\0\0\ttext\rmarkdown\31indentLine_fileTypeExclude\1\3\0\0\thelp\rterminal\30indentLine_bufTypeExclude\b│\20indentLine_char\6g\bvim\0")()
-- Config for: completion-nvim
loadstring("\27LJ\2\n}\0\1\6\0\a\0\22)\1\0\0\2\0\1\0X\1\17�6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2X\2\3�+\1\1\0X\2\1�+\1\2\0L\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\5\0\5\1\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0003\1\4\0\18\2\1\0\18\4\0\0B\2\2\2\15\0\2\0X\3\a�\18\2\1\0\23\4\0\0B\2\2\2\15\0\2\0X\3\2�+\2\2\0X\3\1�+\2\1\0002\0\0�L\2\2\0\0\6.\bcol\afn\bvim\2�\6\1\0\4\0\15\0\0266\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0004\1\4\0005\2\5\0005\3\4\0=\3\6\2>\2\1\0015\2\a\0>\2\2\0015\2\b\0>\2\3\1=\1\3\0006\0\t\0003\1\v\0=\1\n\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0+\3\1\0B\0\3\1K\0\1\0�\4            \" <TAB>/<S-TAB> through completeopts\n            inoremap <silent> <expr> <TAB> pumvisible() ? \"\\<C-n>\" : v:lua.check_behind() ? \"\\<TAB>\" : completion#trigger_completion()\n            \" inoremap <expr> <S-TAB> pumvisible() ? \"\\<C-p>\" : \"\\<S-TAB>\"\n\n            \" prevent completion-nvim from conflicting with auto-pairs plugins\n            let g:completion_confirm_key = \"\"\n            inoremap <expr> <CR> pumvisible() ? complete_info()[\"selected\"] != \"-1\" ? \"\\<Plug>(completion_confirm_completion)\" : \"\\<c-e>\\<CR>\" : \"\\<CR>\"\n          \14nvim_exec\bapi\0\17check_behind\a_G\1\0\1\tmode\n<c-n>\1\0\1\tmode\n<c-p>\19complete_items\1\0\0\1\2\0\0\blsp#completion_chain_complete_list%completion_enable_auto_signature\6g\bvim\0")()
-- Config for: vim-better-whitespace
loadstring("\27LJ\2\n�\1\0\0\3\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\"command! Trim StripWhitespace\bcmd\28strip_whitelines_at_eof\30better_whitespace_enabled\6g\bvim\0")()
-- Config for: vim-signify
loadstring("\27LJ\2\n�\4\0\0\4\0\r\0\0276\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\6\0=\1\a\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\n\0009\0\v\0'\2\f\0+\3\1\0B\0\3\1K\0\1\0�\2            set signcolumn=yes\n            highlight! link SignifySignChange GruvboxBlueSign\n\n            \" nifty hunk motions\n            omap ic <Plug>(signify-motion-inner-pending)\n            xmap ic <Plug>(signify-motion-inner-visual)\n            omap ac <Plug>(signify-motion-outer-pending)\n            xmap ac <Plug>(signify-motion-outer-visual)\n          \14nvim_exec\bapi\b\24signify_sign_change#signify_sign_delete_first_line\b\24signify_sign_delete\b\21signify_sign_add\21signify_priority\6g\bvim\0")()
-- Config for: formatter.nvim
loadstring("\27LJ\2\n�\2\0\0\6\0\14\0 6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0005\2\4\0'\3\5\0B\0\3\0026\1\6\0009\1\a\0019\1\b\1'\3\t\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\n\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\v\0\18\4\0\0'\5\f\0&\3\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\r\0B\1\2\1K\0\1\0\16augroup end/ nnoremap <buffer> <silent> gf :Format<CR>\22autocmd FileType \rautocmd!\23augroup format_map\17nvim_command\bapi\bvim\6,\1\t\0\0\bcss\thtml\15javascript\tjson\blua\rmarkdown\ash\nyaml*\vconcat\ntable\17tb.formatter\frequire\0")()
-- Config for: nvim-lspconfig
loadstring("\27LJ\2\n�\v\0\0\4\0\t\0\0166\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0005\2\4\0B\0\2\0016\0\5\0009\0\6\0009\0\a\0'\2\b\0+\3\1\0B\0\3\1K\0\1\0�\t            nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>\n            nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>\n            nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.hover()<CR>\n            nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>\n            nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>\n            nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>\n            nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>\n            nnoremap <silent> [d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>\n            nnoremap <silent> ]d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>\n\n            \" TODO: Get working\n            nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>\n\n            \" nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>\n            \" nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>\n            \" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>\n            \" nnoremap <silent> <leader>K <cmd>lua vim.lsp.buf.signature_help()<CR>\n            \" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>\n          \14nvim_exec\bapi\bvim\1\0\4\15infor_sign\b\14warn_sign\b\14hint_sign\b➤\15error_sign\b\18init_lsp_saga\flspsaga\vtb.lsp\frequire\0")()
-- Config for: vim-envelop
loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15tb.envelop\frequire\0")()
-- Config for: blamer.nvim
loadstring("\27LJ\2\n�\2\0\0\4\0\b\0\0156\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0009\0\6\0'\2\a\0+\3\1\0B\0\3\1K\0\1\0q            nnoremap <Leader>b :BlamerToggle<CR>\n            vnoremap <Leader>b :BlamerToggle<CR>\n          \14nvim_exec\bapi-<author>, <committer-time> • <summary>\20blamer_template\17blamer_delay\6g\bvim\0")()
-- Config for: vim-dirvish
loadstring("\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23loaded_netrwPlugin\6g\bvim\0")()
-- Config for: vim-signature
loadstring("\27LJ\2\n<\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\31SignatureMarkTextHLDynamic\6g\bvim\0")()
-- Config for: telescope.nvim
loadstring("\27LJ\2\n�\3\0\0\6\0\15\0\0286\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\0028<cmd>lua require('telescope.builtin').buffers()<CR>\n<C-b>\1\0\2\vsilent\2\fnoremap\0029<cmd>lua require('tb.telescope').project_files()<CR>\n<C-p>\1\0\2\vsilent\2\fnoremap\0028<cmd>lua require('telescope.builtin').builtin()<CR>\21<Leader><Leader>\6n\20nvim_set_keymap\bapi\bvim\17tb.telescope\frequire\0")()
-- Config for: vim-airline
loadstring("\27LJ\2\n9\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\28airline_powerline_fonts\6g\bvim\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18tb.treesitter\frequire\0")()
-- Config for: gruvbox
loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15tb.gruvbox\frequire\0")()
-- Config for: quick-scope
loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
  call luaeval('_packer_load_wrapper(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType css ++once call s:load(['nvim-colorizer.lua'], { "ft": "css" })
  au FileType markdown ++once call s:load(['markdown-preview.nvim'], { "ft": "markdown" })
  au FileType html ++once call s:load(['nvim-colorizer.lua'], { "ft": "html" })
  " Event lazy-loads
  au VimEnter * ++once call s:load(['vim-polyglot'], { "event": "VimEnter *" })
  " Function lazy-loads
augroup END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
