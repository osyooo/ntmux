-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Frappe"

config.font = wezterm.font("JetBrains Mono", { weight = "Regular" })
config.font_size = 20
config.window_decorations = "NONE"

-- and finally, return the configuration to wezterm
return config
