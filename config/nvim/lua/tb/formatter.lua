local prettier = {
  function()
    return {
      exe = "prettier",
      args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
      stdin = true,
    }
  end,
}
require("formatter").setup({
  filetype = {
    css = prettier,
    html = prettier,
    javascript = prettier,
    json = prettier,
    lua = {
      function()
        return {
          exe = "luafmt",
          args = { "--indent-count", 2, "--line-width", 80, "--stdin" },
          stdin = true,
        }
      end,
    },
    markdown = prettier,
    sh = {
      function()
        return {
          exe = "shfmt",
          args = { "-i", 2 },
          stdin = true,
        }
      end,
    },
    yaml = prettier,
    -- TODO: formatter.nvim PR to support filetype patterns
    ["yaml.docker-compose"] = prettier,
  },
})
