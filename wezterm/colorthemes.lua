local wezterm = require("wezterm")
local rp = require("execrightpane")
local paths = require("paths")
local M = {}

local function Theme_picker(window, pane)
	local script = paths.config_dir .. "/scripts/fzf_themes"
	rp.exec_right_pane(window, pane, script)
end

function M.theme_picker(config)
	table.insert(config.keys, {
		key = "x",
		mods = "LEADER",
		action = wezterm.action_callback(Theme_picker),
	})
end

return M
