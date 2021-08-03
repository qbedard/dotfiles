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
    -- class = "",
    class = "ﴯ",
    color = "",
    constant = "",
    constructor = "",
    -- enum = "",
    enum = "",
    -- enummember = "",
    enummember = "",
    event = "",
    field = "",
    file = "",
    -- folder = " ﱮ ",
    folder = "ﱮ",
    ["function"] = "",
    -- interface = "⧲",
    interface = "",
    -- keyword = "",
    keyword = "",
    method = "",
    module = "",
    operator = "",
    property = "",
    -- reference = "漏",
    reference = "",
    -- snippet = "…",
    snippet = "",
    -- struct = "⚎",
    struct = "פּ",
    text = "",
    typeparameter = "",
    unit = "塞",
    value = "",
    -- variable = "𝒙",
    variable = ""
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
