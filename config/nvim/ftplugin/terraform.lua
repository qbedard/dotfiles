-- Open the Terraform Registry docs for the resource or data source under the
-- cursor. terraform-ls has already resolved the provider namespace in its
-- hover response, so we reuse that rather than parsing required_providers.
local function open_registry_docs()
  local client = vim.lsp.get_clients({ bufnr = 0, name = "terraformls" })[1]
  if not client then
    vim.notify("terraform-ls not attached", vim.log.levels.WARN)
    return
  end

  local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
  client:request("textDocument/hover", params, function(err, result)
    local value = result and result.contents and result.contents.value or ""
    -- Hover format: `<type>` <namespace>/<provider> <version>\n\n<kind>
    local rtype, source, version = value:match("^`([^`]+)`%s+(%S+/%S+)%s+(%S+)")
    if err or not rtype then
      vim.notify("No registry doc target under cursor", vim.log.levels.WARN)
      return
    end

    local category = value:match("Data Source") and "data-sources" or "resources"
    local provider = source:match("/(.+)$")
    -- Resource names are prefixed with the provider type, e.g. aws_instance.
    local page = rtype:gsub("^" .. vim.pesc(provider) .. "_", "")

    vim.ui.open(
      string.format(
        "https://registry.terraform.io/providers/%s/%s/docs/%s/%s",
        source,
        version,
        category,
        page
      )
    )
  end, 0)
end

vim.keymap.set("n", "gK", open_registry_docs, {
  buffer = true,
  desc = "Open Terraform Registry docs",
})
