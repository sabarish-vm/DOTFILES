local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

function M.apply_keymap(config)
	config.leader = { key = "n", mods = "CTRL", timeout_milliseconds = 1000 }
	table.insert(config.keys, { key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay })
	table.insert(config.keys, {
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = act.SendKey({ key = "LeftArrow", mods = "CTRL|SHIFT" }),
	})
	table.insert(config.keys, {
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = act.SendKey({ key = "RightArrow", mods = "CTRL|SHIFT" }),
	})
end

return M
