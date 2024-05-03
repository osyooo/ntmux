-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()

config.font = wezterm.font("Hack Nerd Font Mono", { weight = "Regular" })
config.font_size = 18

-- and finally, return the configuration to wezterm
return config
