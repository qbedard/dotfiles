-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "GruvboxDark"
config.window_frame = {
  active_titlebar_bg = "#1d2021",
  font = wezterm.font({ family = "Hack NF JBM Ligatured CCG", weight = "Bold" }),
}
config.colors = {
  tab_bar = {
    -- active_tab = { fg_color = "#ebdbb2", bg_color = "#282828" },
    active_tab = { fg_color = "#d5c4a1", bg_color = "#282828" },
    -- active_tab = { fg_color = "#bdae93", bg_color = "#282828" },
    -- inactive_tab = { fg_color = "#bdae93", bg_color = "#1d2021" },
    inactive_tab = { fg_color = "#a89984", bg_color = "#1d2021" },
    -- new_tab = { fg_color = "#bdae93", bg_color = "#1d2021" },
    new_tab = { fg_color = "#a89984", bg_color = "#1d2021" },
  },
}
config.font = wezterm.font("Hack NF JBM Ligatured CCG")
config.font_size = 14.0
config.freetype_load_flags = "NO_HINTING" -- improves some font rendering
config.show_tab_index_in_tab_bar = false
-- config.tab_bar_at_bottom = true
-- config.use_fancy_tab_bar = false

-- and finally, return the configuration to wezterm
return config
