local i = require("icons")

return {
  "liuchengxu/vista.vim",
  enabled=false,
  init = function()
    vim.g["vista#renderer#icons"] = {
      class = i.lang.class,
      color = i.lang.color,
      constant = i.lang.constant,
      constructor = i.lang.constructor,
      enum = i.lang.enum,
      enummember = i.lang.enummember,
      event = i.lang.event,
      field = i.lang.field,
      file = i.lang.file,
      folder = i.lang.folder,
      ["function"] = i.lang["function"],
      interface = i.lang.interface,
      keyword = i.lang.keyword,
      method = i.lang.method,
      module = i.lang.module,
      operator = i.lang.operator,
      property = i.lang.property,
      reference = i.lang.reference,
      snippet = i.lang.snippet,
      struct = i.lang.struct,
      text = i.lang.text,
      typeparameter = i.lang.typeparameter,
      unit = i.lang.unit,
      value = i.lang.value,
      variable = i.lang.variable,
    }
  end,
}
