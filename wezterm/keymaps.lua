local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

function M.apply_keymap(config)
	config.leader = { key = "n", mods = "CTRL", timeout_milliseconds = 1000 }

	local keymap_definitions = {
		{ key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
		{ key = "LeftArrow", mods = "CTRL|SHIFT", action = act.SendKey({ key = "LeftArrow", mods = "CTRL|SHIFT" }) },
		{ key = "RightArrow", mods = "CTRL|SHIFT", action = act.SendKey({ key = "RightArrow", mods = "CTRL|SHIFT" }) },
		{ key = "l", mods = "SUPER|SHIFT", action = act.MoveTabRelative(1) },
		{ key = "h", mods = "SUPER|SHIFT", action = act.MoveTabRelative(-1) },
	}
	for _, binding in ipairs(keymap_definitions) do
		table.insert(config.keys, binding)
	end
end

return M
