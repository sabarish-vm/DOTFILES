local keymaps = require("keymaps")
local themes = require("colorthemes")

local config = {}
config.keys = config.keys or {}

config.color_scheme = "Darkside"
config.window_decorations = "INTEGRATED_BUTTONS"
config.max_fps = 120

keymaps.apply_keymap(config)
themes.theme_picker(config)

return config
