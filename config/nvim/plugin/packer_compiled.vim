" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

lua << END
local plugins = {
  fzf = {
    load_after = {
      ["fzf.vim"] = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/fzf"
  },
  ["fzf.vim"] = {
    after = { "fzf" },
    config = { "\27LJ\2\nÇ\3\0\0\4\0\t\0\r6\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\1=\1\2\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0+\3\1\0B\0\3\1K\0\1\0Û\2            \" mappings\n            nnoremap <C-f> :BLines<CR>\n            nnoremap <C-b> :Buffers<CR>\n            nnoremap <C-c> :Commands<CR>\n\n            \" show files in a git project root (or current dir if not project)\n            command! ProjectFiles execute 'Files' FindGitRoot()\n            nnoremap <C-p> :ProjectFiles<CR>\n          \14nvim_exec\bapi\bbg+\1\0\0\1\3\0\0\abg\vNormal\15fzf_colors\6g\bvim\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/fzf.vim"
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
  ["vim-polyglot"] = {
    config = { "\27LJ\2\nk\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\2\0=\1\3\0K\0\1\0&vim_markdown_new_list_item_indent\28javascript_plugin_jsdoc\6g\bvim\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/tim/.local/share/nvim/site/pack/packer/opt/vim-polyglot"
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
-- Setup for: vim-polyglot
loadstring("\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\thelm\22polyglot_disabled\6g\bvim\0")()
-- Post-load configuration
-- Config for: vim-envelop
loadstring('\27LJ\2\nä\b\0\0\2\0\f\0\0216\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0K\0\1\0\1\14\0\0\nblack\vflake8\19flake8-bugbear\nisort\16pep8-naming\bpip\15pyls-black\15pyls-isortFgit+https://github.com/tomv564/pyls-mypy.git@master#egg=pyls_mypy\vpynvim python-language-server[all]\rsqlparse\rvim-vint\29envelop_python3_packages\1\n\0\0\14bin/black\15bin/flake8\14bin/isort\rbin/mypy\rbin/pip3\rbin/pyls\16bin/python3\18bin/sqlformat\rbin/vint\25envelop_python3_link\1\f\0\0\25bash-language-server&dockerfile-language-server-nodejs\flua-fmt\rprettier\15typescript\31typescript-language-server\24vim-language-server"vscode-css-languageserver-bin#vscode-html-languageserver-bin\31vscode-json-languageserver\25yaml-language-server\26envelop_node_packages\1\v\0\0\29node_modules/.bin/luafmt\31node_modules/.bin/prettier+node_modules/.bin/bash-language-server)node_modules/.bin/css-languageserver(node_modules/.bin/docker-langserver*node_modules/.bin/html-languageserver1node_modules/.bin/typescript-language-server*node_modules/.bin/vim-language-server1node_modules/.bin/vscode-json-languageserver+node_modules/.bin/yaml-language-server\22envelop_node_link\1\3\0\0\tnode\fpython3\20envelop_enabled\6g\bvim\0')()
-- Config for: pear-tree
loadstring("\27LJ\2\nw\0\0\2\0\5\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0K\0\1\0 pear_tree_repeatable_expand\1\2\0\0\20TelescopePrompt\26pear_tree_ft_disabled\6g\bvim\0")()
-- Config for: vim-signature
loadstring("\27LJ\2\n<\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\31SignatureMarkTextHLDynamic\6g\bvim\0")()
-- Config for: vim-signify
loadstring("\27LJ\2\né\4\0\0\4\0\r\0\0276\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\6\0=\1\a\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\n\0009\0\v\0'\2\f\0+\3\1\0B\0\3\1K\0\1\0ð\2            set signcolumn=yes\n            highlight! link SignifySignChange GruvboxBlueSign\n\n            \" nifty hunk motions\n            omap ic <Plug>(signify-motion-inner-pending)\n            xmap ic <Plug>(signify-motion-inner-visual)\n            omap ac <Plug>(signify-motion-outer-pending)\n            xmap ac <Plug>(signify-motion-outer-visual)\n          \14nvim_exec\bapi\bï‘„\24signify_sign_change#signify_sign_delete_first_line\bï’‹\24signify_sign_delete\bï‘\21signify_sign_add\21signify_priority\6g\bvim\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15treesitter\frequire\0")()
-- Config for: gruvbox
loadstring("\27LJ\2\nñ\3\0\0\3\0\14\0)6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0'\2\6\0B\0\2\0016\0\0\0009\0\5\0'\2\a\0B\0\2\0016\0\0\0009\0\5\0'\2\b\0B\0\2\0016\0\0\0009\0\5\0'\2\t\0B\0\2\0016\0\0\0009\0\5\0'\2\n\0B\0\2\0016\0\0\0009\0\5\0'\2\v\0B\0\2\0016\0\0\0009\0\5\0'\2\f\0B\0\2\0016\0\0\0009\0\5\0'\2\r\0B\0\2\1K\0\1\0)highlight! link TSMethod GruvboxAqua+highlight! link TSFunction GruvboxAqua*highlight! link TSOperator GruvboxRed.highlight! link TSKeywordOperator Keyword,highlight! link TSConstBuiltin Constant&highlight! link FoldColumn LineNr\31highlight clear FoldColumn\24colorscheme gruvbox\bcmd\bbg0\24gruvbox_sign_column\19gruvbox_italic\6g\bvim\0")()
-- Config for: vim-airline
loadstring("\27LJ\2\nt\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\0\2\vbranch\bï˜\rreadonly\bï€£\20airline_symbols\28airline_powerline_fonts\6g\bvim\0")()
-- Config for: completion-nvim
loadstring("\27LJ\2\n}\0\1\6\0\a\0\22)\1\0\0\2\0\1\0X\1\17€6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2X\2\3€+\1\1\0X\2\1€+\1\2\0L\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\5\0\5\1\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0003\1\4\0\18\2\1\0\18\4\0\0B\2\2\2\15\0\2\0X\3\a€\18\2\1\0\23\4\0\0B\2\2\2\15\0\2\0X\3\2€+\2\2\0X\3\1€+\2\1\0002\0\0€L\2\2\0\0\6.\bcol\afn\bvim\2ì\5\1\0\4\0\15\0\0266\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0004\1\4\0005\2\5\0005\3\4\0=\3\6\2>\2\1\0015\2\a\0>\2\2\0015\2\b\0>\2\3\1=\1\3\0006\0\t\0003\1\v\0=\1\n\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0+\3\1\0B\0\3\1K\0\1\0å\3            \" <TAB>/<S-TAB> through completeopts\n            inoremap <silent><expr> <TAB> pumvisible() ? \"\\<C-n>\" : v:lua.check_behind() ? \"\\<TAB>\" : completion#trigger_completion()\n            inoremap <expr><S-TAB> pumvisible() ? \"\\<C-p>\" : \"\\<C-h>\"\n\n            \" prevent completion-nvim from conflicting with auto-pairs\n            let g:completion_confirm_key = \"\"\n            inoremap <expr> <CR> pumvisible() ? \"\\<Plug>(completion_confirm_completion)\" : \"\\<CR>\"\n          \14nvim_exec\bapi\0\17check_behind\a_G\1\0\1\tmode\n<c-n>\1\0\1\tmode\n<c-p>\19complete_items\1\0\0\1\2\0\0\blsp#completion_chain_complete_list%completion_enable_auto_signature\6g\bvim\0")()
-- Config for: quick-scope
loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0")()
-- Config for: formatter.nvim
loadstring("\27LJ\2\n€\1\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\21--stdin-filepath\1\0\2\bexe\rprettier\nstdin\2\5€€À™\4N\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\bexe\vluafmt\nstdin\2Ê\6\1\0\a\0\19\0\0284\0\3\0003\1\0\0>\1\1\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\r\0005\4\4\0=\0\5\4=\0\6\4=\0\a\4=\0\b\0044\5\3\0003\6\t\0>\6\1\5=\5\n\4=\0\v\4=\0\f\4=\4\14\3B\1\2\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0+\4\1\0B\1\3\1K\0\1\0ð\4            augroup format_map\n              autocmd FileType css nnoremap <buffer> <silent> gf :Format<CR>\n              autocmd FileType html nnoremap <buffer> <silent> gf :Format<CR>\n              autocmd FileType javascript nnoremap <buffer> <silent> gf :Format<CR>\n              autocmd FileType json nnoremap <buffer> <silent> gf :Format<CR>\n              autocmd FileType lua nnoremap <buffer> <silent> gf :Format<CR>\n              autocmd FileType markdown nnoremap <buffer> <silent> gf :Format<CR>\n              autocmd FileType yaml nnoremap <buffer> <silent> gf :Format<CR>\n            augroup end\n          \14nvim_exec\bapi\bvim\rfiletype\1\0\0\tyaml\rmarkdown\blua\0\tjson\15javascript\thtml\bcss\1\0\0\nsetup\14formatter\frequire\0\0")()
-- Config for: blamer.nvim
loadstring("\27LJ\2\n˜\2\0\0\4\0\b\0\0156\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0009\0\6\0'\2\a\0+\3\1\0B\0\3\1K\0\1\0                nnoremap <Leader>b :BlamerToggle<CR>\n                vnoremap <Leader>b :BlamerToggle<CR>\n                \14nvim_exec\bapi-<author>, <committer-time> â€¢ <summary>\20blamer_template\17blamer_delay\6g\bvim\0")()
-- Config for: indentLine
loadstring("\27LJ\2\n®\1\0\0\2\0\b\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0K\0\1\0\1\3\0\0\ttext\rmarkdown\31indentLine_fileTypeExclude\1\3\0\0\thelp\rterminal\30indentLine_bufTypeExclude\bâ”‚\20indentLine_char\6g\bvim\0")()
-- Config for: vim-better-whitespace
loadstring("\27LJ\2\n•\1\0\0\3\0\6\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\"command! Trim StripWhitespace\bcmd\28strip_whitelines_at_eof\30better_whitespace_enabled\6g\bvim\0")()
-- Config for: nvim-lspconfig
loadstring("\27LJ\2\nÇ\6\0\0\4\0\6\0\n6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0'\2\5\0+\3\1\0B\0\3\1K\0\1\0ý\5            nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>\n            \" nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>\n            \" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>\n            nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.hover()<CR>\n            \" nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>\n            \" nnoremap <silent> <leader>K <cmd>lua vim.lsp.buf.signature_help()<CR>\n            nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>\n            nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>\n            nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>\n            nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>\n          \14nvim_exec\bapi\bvim\blsp\frequire\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file MarkdownPreview call s:load(['markdown-preview.nvim'], { "cmd": "MarkdownPreview", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType css ++once call s:load(['nvim-colorizer.lua'], { "ft": "css" })
  au FileType html ++once call s:load(['nvim-colorizer.lua'], { "ft": "html" })
  " Event lazy-loads
  au VimEnter * ++once call s:load(['fzf.vim', 'vim-polyglot'], { "event": "VimEnter *" })
augroup END
