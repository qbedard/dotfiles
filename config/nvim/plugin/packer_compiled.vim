" Automatically generated packer.nvim plugin loader code

if !has('nvim')
  finish
endif

lua << END
local plugins = {
  ["diagnostic-nvim"] = {
    loaded = false,
    only_sequence = true,
    only_setup = true,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/diagnostic-nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
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
  ["nvim-lsp-diamove"] = {
    commands = { "Dabove", "Dbelow" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/nvim-lsp-diamove"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
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
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
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
      local prefix = vim.v.count and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Setup for: diagnostic-nvim
loadstring("\27LJ\1\2¤\4\0\0\3\0\16\0%4\0\0\0007\0\1\0007\0\2\0%\1\3\0003\2\4\0>\0\3\0014\0\0\0007\0\1\0007\0\2\0%\1\5\0003\2\6\0>\0\3\0014\0\0\0007\0\1\0007\0\2\0%\1\a\0003\2\b\0>\0\3\0014\0\0\0007\0\1\0007\0\2\0%\1\t\0003\2\n\0>\0\3\0014\0\0\0007\0\v\0'\1\1\0:\1\f\0004\0\0\0007\0\v\0'\1\1\0:\1\r\0004\0\0\0007\0\v\0%\1\15\0:\1\14\0G\0\1\0\bïƒ™#diagnostic_virtual_text_prefix#diagnostic_enable_virtual_text\28diagnostic_insert_delay\6g\1\0\2\ttext\bâž¤\vtexthl\27LspDiagnosticsHintSign\27LspDiagnosticsHintSign\1\0\2\ttext\bïš\vtexthl\"LspDiagnosticsInformationSign\"LspDiagnosticsInformationSign\1\0\2\ttext\bïª\vtexthl\30LspDiagnosticsWarningSign\30LspDiagnosticsWarningSign\1\0\2\ttext\bï€\vtexthl\28LspDiagnosticsErrorSign\28LspDiagnosticsErrorSign\16sign_define\afn\bvim\0")()
vim.cmd("packadd diagnostic-nvim")
-- Post-load configuration
-- Config for: quick-scope
loadstring("\27LJ\1\2B\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0")()
-- Config for: completion-nvim
loadstring("\27LJ\1\2}\0\1\5\0\a\0\22'\1\0\0\2\0\1\0T\1\17€4\1\0\0007\1\1\0017\1\2\1%\2\3\0>\1\2\2\16\2\1\0007\1\4\1\16\3\0\0\16\4\0\0>\1\4\2\16\2\1\0007\1\5\1%\3\6\0>\1\3\2T\2\3€)\1\1\0T\2\1€)\1\2\0H\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\4\0\5\1\0224\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\2\21\0\0\0001\1\4\0\16\2\1\0\16\3\0\0>\2\2\2\15\0\2\0T\3\a€\16\2\1\0\21\3\0\0>\2\2\2\15\0\2\0T\3\2€)\2\2\0T\3\1€)\2\1\0000\0\0€H\2\2\0\0\6.\bcol\afn\bvim\2Þ\5\1\0\4\0\15\0\0264\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0002\1\4\0003\2\5\0003\3\4\0:\3\6\2;\2\1\0013\2\a\0;\2\2\0013\2\b\0;\2\3\1:\1\3\0004\0\t\0001\1\v\0:\1\n\0004\0\0\0007\0\f\0007\0\r\0%\1\14\0)\2\1\0>\0\3\1G\0\1\0×\3          \" <TAB>/<S-TAB> through completeopts\n          inoremap <silent><expr> <TAB> pumvisible() ? \"\\<C-n>\" : v:lua.check_behind() ? \"\\<TAB>\" : completion#trigger_completion()\n          inoremap <expr><S-TAB> pumvisible() ? \"\\<C-p>\" : \"\\<C-h>\"\n\n          \" prevent completion-nvim from conflicting with auto-pairs\n          let g:completion_confirm_key = \"\"\n          inoremap <expr> <CR> pumvisible() ? \"\\<Plug>(completion_confirm_completion)\" : \"\\<CR>\"\n        \14nvim_exec\bapi\0\17check_behind\a_G\1\0\1\tmode\n<c-n>\1\0\1\tmode\n<c-p>\19complete_items\1\0\0\1\2\0\0\blsp#completion_chain_complete_list%completion_enable_auto_signature\6g\bvim\0")()
-- Config for: gruvbox
loadstring("\27LJ\1\2ñ\3\0\0\2\0\14\0)4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\5\0%\1\6\0>\0\2\0014\0\0\0007\0\5\0%\1\a\0>\0\2\0014\0\0\0007\0\5\0%\1\b\0>\0\2\0014\0\0\0007\0\5\0%\1\t\0>\0\2\0014\0\0\0007\0\5\0%\1\n\0>\0\2\0014\0\0\0007\0\5\0%\1\v\0>\0\2\0014\0\0\0007\0\5\0%\1\f\0>\0\2\0014\0\0\0007\0\5\0%\1\r\0>\0\2\1G\0\1\0)highlight! link TSMethod GruvboxAqua+highlight! link TSFunction GruvboxAqua*highlight! link TSOperator GruvboxRed.highlight! link TSKeywordOperator Keyword,highlight! link TSConstBuiltin Constant&highlight! link FoldColumn LineNr\31highlight clear FoldColumn\24colorscheme gruvbox\bcmd\bbg0\24gruvbox_sign_column\19gruvbox_italic\6g\bvim\0")()
-- Config for: indentLine
loadstring("\27LJ\1\2®\1\0\0\2\0\b\0\r4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0G\0\1\0\1\3\0\0\ttext\rmarkdown\31indentLine_fileTypeExclude\1\3\0\0\thelp\rterminal\30indentLine_bufTypeExclude\bâ”‚\20indentLine_char\6g\bvim\0")()
-- Config for: fzf.vim
loadstring("\27LJ\1\2ý\2\0\0\3\0\4\0\a4\0\0\0007\0\1\0007\0\2\0%\1\3\0)\2\1\0>\0\3\1G\0\1\0Ë\2          \" mappings\n          nnoremap <C-f> :BLines<CR>\n          nnoremap <C-b> :Buffers<CR>\n          nnoremap <C-c> :Commands<CR>\n\n          \" show files in a git project root (or current dir if not project)\n          command! ProjectFiles execute 'Files' FindGitRoot()\n          nnoremap <C-p> :ProjectFiles<CR>\n        \14nvim_exec\bapi\bvim\0")()
-- Config for: vim-envelop
loadstring("\27LJ\1\2€\4\0\0\2\0\f\0\0214\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0004\0\0\0007\0\1\0003\1\t\0:\1\b\0004\0\0\0007\0\1\0003\1\v\0:\1\n\0G\0\1\0\1\r\0\0\nblack\vflake8\19flake8-bugbear\nisort\16pep8-naming\bpip\15pyls-black\15pyls-isort\vpynvim python-language-server[all]\rsqlparse\rvim-vint\29envelop_python3_packages\1\t\0\0\14bin/black\15bin/flake8\14bin/isort\rbin/pip3\rbin/pyls\16bin/python3\18bin/sqlformat\rbin/vint\25envelop_python3_link\1\2\0\0\fpyright\26envelop_node_packages\1\3\0\0\30node_modules/.bin/pyright)node_modules/.bin/pyright-langserver\22envelop_node_link\1\3\0\0\tnode\fpython3\20envelop_enabled\6g\bvim\0")()
-- Config for: pear-tree
loadstring("\27LJ\1\2=\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\0\0:\1\2\0G\0\1\0 pear_tree_repeatable_expand\6g\bvim\0")()
-- Config for: blamer.nvim
loadstring("\27LJ\1\2„\2\0\0\3\0\b\0\0154\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\5\0007\0\6\0%\1\a\0)\2\1\0>\0\3\1G\0\1\0k          nnoremap <Leader>b :BlamerToggle<CR>\n          vnoremap <Leader>b :BlamerToggle<CR>\n        \14nvim_exec\bapi-<author>, <committer-time> â€¢ <summary>\20blamer_template\17blamer_delay\6g\bvim\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\1\2*\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\15treesitter\frequire\0")()
-- Config for: vim-signify
loadstring("\27LJ\1\2Ù\4\0\0\3\0\r\0\0274\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0%\1\6\0:\1\5\0004\0\0\0007\0\1\0%\1\6\0:\1\a\0004\0\0\0007\0\1\0%\1\t\0:\1\b\0004\0\0\0007\0\n\0007\0\v\0%\1\f\0)\2\1\0>\0\3\1G\0\1\0à\2          set signcolumn=yes\n          highlight! link SignifySignChange GruvboxBlueSign\n\n          \" nifty hunk motions\n          omap ic <Plug>(signify-motion-inner-pending)\n          xmap ic <Plug>(signify-motion-inner-visual)\n          omap ac <Plug>(signify-motion-outer-pending)\n          xmap ac <Plug>(signify-motion-outer-visual)\n        \14nvim_exec\bapi\bï‘„\24signify_sign_change#signify_sign_delete_first_line\bï’‹\24signify_sign_delete\bï‘\21signify_sign_add\21signify_priority\6g\bvim\0")()
-- Config for: vim-airline
loadstring("\27LJ\1\2t\0\0\2\0\5\0\t4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0003\1\4\0:\1\3\0G\0\1\0\1\0\2\rreadonly\bï€£\vbranch\bï˜\20airline_symbols\28airline_powerline_fonts\6g\bvim\0")()
-- Config for: vim-better-whitespace
loadstring("\27LJ\1\2•\1\0\0\2\0\6\0\r4\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\4\0%\1\5\0>\0\2\1G\0\1\0\"command! Trim StripWhitespace\bcmd\28strip_whitelines_at_eof\30better_whitespace_enabled\6g\bvim\0")()
-- Config for: nvim-lspconfig
loadstring('\27LJ\1\2§\6\0\0\3\0\6\0\n4\0\0\0%\1\1\0>\0\2\0014\0\2\0007\0\3\0007\0\4\0%\1\5\0)\2\1\0>\0\3\1G\0\1\0Ý\5          nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>\n          " nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>\n          " nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>\n          " nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>\n          nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>\n          " nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>\n          nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>\n          nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>\n          " nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>\n          nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>\n        \14nvim_exec\bapi\bvim\blsp\frequire\0')()
-- Config for: vim-signature
loadstring("\27LJ\1\2<\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\1\0:\1\2\0G\0\1\0\31SignatureMarkTextHLDynamic\6g\bvim\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file Dabove call s:load(['nvim-lsp-diamove'], { "cmd": "Dabove", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Dbelow call s:load(['nvim-lsp-diamove'], { "cmd": "Dbelow", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file MarkdownPreview call s:load(['markdown-preview.nvim'], { "cmd": "MarkdownPreview", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType css ++once call s:load(['nvim-colorizer.lua'], { "ft": "css" })
  au FileType html ++once call s:load(['nvim-colorizer.lua'], { "ft": "html" })
  " Event lazy-loads
augroup END
