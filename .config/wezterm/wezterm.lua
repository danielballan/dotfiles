local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'IBM Plex Mono'
config.adjust_window_size_when_changing_font_size = false

return config
