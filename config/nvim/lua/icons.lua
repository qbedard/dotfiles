local codicons = {
  bar = {
    thick = "┃",
    thin = "│",
  },
  fold = {
    collapsed = "",
    expanded = "",
  },
  diag = {
    error = "",
    warn = "",
    hint = "",
    info = "",
    ok = "",
    virtual = "",
  },
  diff = {
    add = "",
    mod = "",
    del = "",
  },
  file = {
    mod = "",
    lock = "",
  },
  git = {
    branch = "",
  },
  lang = {
    class = "",
    color = "",
    constant = "",
    constructor = "",
    enum = "",
    enummember = "",
    event = "",
    field = "",
    file = "",
    folder = "",
    -- ["function"] = "󰊕",
    ["function"] = "󰆧",
    interface = "",
    keyword = "",
    method = "󰆧",
    module = "",
    operator = "",
    property = "",
    reference = "",
    snippet = "",
    struct = "",
    text = "",
    typeparameter = "",
    unit = "",
    value = "",
    variable = "",
  },
}

local _icons = {
  bar = {
    thick = "┃",
    thin = "│",
  },
  fold = {
    collapsed_thin = "󰅂",
    expanded_thin = "󰅀",
    collapsed_thick = "",
    expanded_thick = "",
    collapsed_thin_big = "",
    expanded_thin_big = "",
  },
  diag = {
    error = "",
    warn = "",
    hint = "",
    info = "",
    ok = "",
    virtual = "•",
  },
  diff = {
    add = "",
    mod = "",
    del = "",
  },
  file = {
    mod = "󰏫",
    lock = "",
  },
  git = {
    branch = "",
  },
  lang = {
    class = "󰠱",
    color = "󰏘",
    constant = "",
    constructor = "",
    enum = "",
    -- enum = "",
    enummember = "",
    -- enummember = "",
    event = "",
    field = "",
    -- field = "󰜢",
    file = "󰈙",
    -- folder = " 󰝰 ",
    folder = "󰝰",
    -- folder = "󰉋",
    ["function"] = "󰊕",
    -- interface = "⧲",
    interface = "",
    keyword = "󰌆",
    -- keyword = "󰌋",
    method = "󰆧",
    module = "",
    operator = "󰆕",
    property = "",
    reference = "󰈇",
    snippet = "",
    struct = "󰙅",
    -- struct = "⚎",
    text = "󰉿",
    typeparameter = " ",
    unit = "",
    -- unit = "󰑭",
    value = "󰎠",
    variable = "󰀫",
    -- variable = "𝒙",
  },
}

local icons = vim.tbl_extend("force", {}, _icons)

icons.kind = {}
for k, v in pairs(icons.lang) do
  k = k:sub(1,1):upper() .. k:sub(2)
  icons.kind[k] = v
end

for name, section in pairs(_icons) do
  for k, v in pairs(section) do
    icons[name]["_" .. k] = " " .. v -- leading space
    icons[name][k .. "_"] = v .. " " -- trailing space
    icons[name]["_" .. k .. "_"] = " " .. v .. " " -- both
  end
end

return icons
