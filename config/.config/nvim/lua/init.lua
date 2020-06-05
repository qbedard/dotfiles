local M = {}

function M.setup_nvim_lsp()
  local on_attach = function()
    require'completion'.on_attach()
    require'diagnostic'.on_attach()
  end

  require'nvim_lsp'.bashls.setup{on_attach=on_attach}
  require'nvim_lsp'.cssls.setup{on_attach=on_attach}
  require'nvim_lsp'.html.setup{on_attach=on_attach}
  require'nvim_lsp'.pyls.setup{
    on_attach = on_attach,
    settings = {
      pyls = {
        configurationSources = {'flake8'},
        plugins = {
          autopep8 = {enabled = false},
          black = {enabled = true},
          flake8 = {
            enabled = true,
          },
          pycodestyle = {
            enabled = false,
            maxLineLength = 88,
          },
          pyflakes = {enabled = false},
          yapf = {enabled = false},
        }
      }
    }
  }
  -- require'nvim_lsp'.sumneko_lua.setup{
  --   on_attach = on_attach,
  --   cmd = {"path", "to", "cmd"};
  -- }
  require'nvim_lsp'.tsserver.setup{on_attach=on_attach}
  require'nvim_lsp'.vimls.setup{
    on_attach=require'completion'.on_attach,
    init_options = {
      runtimepath = vim.api.nvim_get_option('runtimepath'),
      indexes = {
        gap = 75,
        count = 5,
      },
    },
  }
end

return M
