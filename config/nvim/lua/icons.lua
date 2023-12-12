local _icons = {
  bar = {
    thick = "┃",
    thin = "│",
  },
  fold = {
    collapsed_thin = "",
    expanded_thin = "",
    collapsed_thick = "",
    expanded_thick = "",
    collapsed_thin_big = "",
    expanded_thin_big = "",
  },
  diag = {
    error = "",
    warn = "",
    -- hint = "➤",
    hint = "",
    info = "",
    ok = "",
    -- virtual = ""
    virtual = "•",
  },
  diff = {
    add = "",
    mod = "",
    del = "",
  },
  file = {
    mod = "",
    lock = "",
  },
  git = {
    branch = "",
  },
  lang = {
    -- class = "",
    class = "ﴯ",
    color = "",
    constant = "",
    -- Constant = "",
    constructor = "",
    -- enum = "",
    enum = "",
    -- enummember = "",
    enummember = "",
    event = "",
    field = "",
    -- Field = "ﰠ",
    file = "",
    -- folder = " ﱮ ",
    folder = "ﱮ",
    -- Folder = "",
    ["function"] = "",
    -- interface = "⧲",
    interface = "",
    -- keyword = "",
    keyword = "",
    method = "",
    module = "",
    operator = "",
    property = "",
    -- Property = "ﰠ",
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
    variable = "",
  },
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
