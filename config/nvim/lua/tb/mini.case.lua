local case = {}
-- cases
function case.camel(word) end

function case.dash(word) end

function case.dot(word) end

function case.mixed(word) end

function case.snake(word) end

function case.space(word) end

function case.title(word) end

function case.upper(word) end

-- TODO: substitution
-- function case.sub(word) end

function case.setup(config)
  -- mappings --
  -- cr...
  vim.keymap.set("n", "crc", case.camel)

  -- ...iw
end

return case
