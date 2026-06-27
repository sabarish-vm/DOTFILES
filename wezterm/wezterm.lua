---@type WezTerm
local wezterm = require("wezterm")

---@type Config
local config = wezterm.config_builder()

local keymaps = require("keymaps")
local themes = require("colorthemes")
local ssh_opts = require("ssh")
local resurrect = require("resurrect")
local status = require("status")
require("wezrun")

config.font = wezterm.font("JetBrainsMono Nerd Font")

config.keys = config.keys or {}
config.use_fancy_tab_bar = false

config.color_scheme = "Darkside"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.window_decorations = "INTEGRATED_BUTTONS"
config.max_fps = 60

keymaps.apply_keymap(config)
themes.theme_picker(config)
status.add_status_bar()

config.ssh_domains = ssh_opts
resurrect.apply_keymap(config)

return config
