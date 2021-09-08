-- Hot reload config
local reload_config = function(files)
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      hs.reload()
      break
    end
  end
end
local reloader = hs.pathwatcher.new(
  (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config") .. "/hammerspoon",
  reload_config
):start()
hs.alert.show("Config loaded!")

-- Caffeine
local caffeine = hs.menubar.new()
local set_caffeine_display = function(state)
  if state then
    caffeine:setTitle("😇")
  else
    caffeine:setTitle("😪")
  end
end

local caffeine_clicked = function()
  set_caffeine_display(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
  caffeine:setClickCallback(caffeine_clicked)
  set_caffeine_display(hs.caffeinate.get("displayIdle"))
end

-- Map Caps Lock to Ctrl/Esc on built-in keyboard

-- Zoom/Discord mic mute

-- Move windows around
-- hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "H", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()

--   f.x = f.x - 10
--   win:setFrame(f)
-- end)

-- Change Spoons dir location?

-- Install SpoonInstall

--- Spoons ---
-- - ReloadConfiguration
