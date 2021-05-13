local _icons = {
  bar = {
    thick = "┃",
    thin = "│"
  },
  diag = {
    error = "",
    warn = "",
    -- hint = "➤",
    hint = "",
    info = "",
    pass = "",
    -- virtual = ""
    virtual = "•"
  },
  diff = {
    add = "",
    mod = "",
    del = ""
  },
  file = {
    mod = "",
    lock = ""
  },
  git = {
    branch = ""
  },
  lang = {
    class = "",
    color = "",
    constant = "",
    constructor = "",
    enum = "",
    enummember = "",
    event = "",
    field = "𝒙",
    file = "",
    folder = " ﱮ ",
    ["function"] = "", -- "function" is a keyword
    interface = "⧲",
    keyword = "",
    method = "",
    module = "",
    operator = "+",
    property = "",
    reference = "漏",
    snippet = "…",
    struct = "⚎",
    text = "",
    typeparameter = "",
    unit = "塞",
    value = "",
    variable = "𝒙"
  }
}

local icons = vim.tbl_extend("force", {}, _icons)
for name, section in pairs(_icons) do
  for k, v in pairs(section) do
    icons[name]["_" .. k] = " " .. v -- leading space
    icons[name][k .. "_"] = v .. " " -- trailing space
    icons[name]["_" .. k .. "_"] = " " .. v .. " " -- both
  end
end

return icons
