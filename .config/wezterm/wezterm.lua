local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.adjust_window_size_when_changing_font_size = false
config.font = wezterm.font_with_fallback {
  {
    family = 'Monaspace Neon',
    weight = 'Regular',
    stretch = 'Normal',
    style = 'Normal',
    harfbuzz_features = {
      'calt', 'liga', 'dlig',
      'ss01', 'ss02', 'ss03', 'ss04', 'ss05',
      'ss06', 'ss07', 'ss08',
    },
  },
  'Ubuntu Mono', -- fallback for Ubuntu
  'Cascadia Mono', -- fallback for Windows
  'Consolas', -- universal fallback
  'Noto Color Emoji', -- for missing glyphs
}

return config
