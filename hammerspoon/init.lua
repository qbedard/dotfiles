-- Install SpoonInstall if needed
local spoon_install_path = hs.spoons.resourcePath("Spoons")
if
  not pcall(function()
    hs.fs.dir(spoon_install_path .. "/SpoonInstall.spoon")
  end)
then
  hs.http.asyncGet(
    "https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip",
    nil,
    function(status, body, headers)
      local zipfile = spoon_install_path .. "/SpoonInstall.spoon.zip"
      io.open(zipfile, "w"):write(body):close()
      hs.execute(string.format("/usr/bin/unzip -d %s %s", spoon_install_path, zipfile))
      hs.execute(string.format("/bin/rm '%s'", zipfile))
    end
  )
end

--- Spoons ---
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall:andUse("Caffeine")
-- spoon.SpoonInstall:andUse(
--   "MicMute",
--   { hotkeys = { toggle = { { "cmd", "shift" }, "a" } } }
-- )
spoon.SpoonInstall:andUse("ReloadConfiguration")

-- TODO: PR to support symlinks
spoon.ReloadConfiguration.watch_paths = {
  os.getenv("HOME") .. "/.dotfiles/hammerspoon",
}
spoon.ReloadConfiguration:start()

spoon.Caffeine:start()

-- Zoom/Discord mic mute
-- spoon.MicMute:bindHotkeys({ toggle = { { "cmd", "shift" }, "a" } }, 0.75)

-- Map Caps Lock to Ctrl/Esc on built-in keyboard

-- Move windows around
-- hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "H", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()

--   f.x = f.x - 10
--   win:setFrame(f)
-- end)
