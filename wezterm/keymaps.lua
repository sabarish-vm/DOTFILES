local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

function M.apply_keymap(config)
	config.disable_default_key_bindings = true
	config.leader = { mods = "SUPER", key = "a", timeout_milliseconds = 1000 }

	local keymap_definitions = {
		{ mods = "SUPER", key = "-", action = wezterm.action.DecreaseFontSize },
		{ mods = "SUPER", key = "+", action = wezterm.action.IncreaseFontSize },
		{ mods = "SUPER", key = "v", action = wezterm.action.PasteFrom("Clipboard") },
		{ mods = "SUPER", key = "c", action = wezterm.action.CopyTo("Clipboard") },
		{ mods = "SUPER", key = "n", action = wezterm.action.SpawnWindow },
		{ mods = "SUPER", key = "t", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{ mods = "SUPER", key = "w", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
		{ mods = "SUPER", key = "d", action = wezterm.action.ShowDebugOverlay },
		-- { mods = "CTRL|SHIFT", key = "LeftArrow", action = act.SendKey({ mods = "CTRL|SHIFT", key = "LeftArrow" }) },
		-- { mods = "CTRL|SHIFT", key = "RightArrow", action = act.SendKey({ mods = "CTRL|SHIFT", key = "RightArrow" }) },
		{ mods = "SUPER", key = "]", action = act.ActivateTabRelative(1) },
		{ mods = "SUPER", key = "[", action = act.ActivateTabRelative(-1) },
		{ mods = "SUPER|SHIFT", key = "]", action = act.MoveTabRelative(1) },
		{ mods = "SUPER|SHIFT", key = "[", action = act.MoveTabRelative(-1) },
		{ mods = "SUPER|SHIFT", key = "P", action = act.ActivateCommandPalette },
		{ mods = "SUPER", key = "u", action = act.CharSelect },
		{ mods = "SUPER", key = "/", action = act.ActivateCopyMode },
		{ mods = "SUPER", key = "F", action = act.QuickSelect },
		{ mods = "LEADER", key = "v", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ mods = "LEADER", key = "h", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{
			mods = "CTRL|SHIFT",
			key = "O",
			action = wezterm.action_callback(function(window, _)
				local tab_info = window:mux_window():tabs_with_info()
				local dic = {}
				for _, value in ipairs(tab_info) do
					if value.is_active then
						dic["current"] = value.index
					end
				end
				local last_id = tab_info[#tab_info].index
				dic["last"] = last_id
				window:toast_notification(
					"",
					"Last : " .. dic["last"] .. "\n" .. "Current : " .. dic["current"],
					nil,
					4000
				)
				local newtab, newpane, _ = window:mux_window():spawn_tab({})
				newtab:activate()
				window:perform_action(wezterm.action.MoveTab(dic["current"]), newpane)
			end),
		},
	}
	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "CMD",
			action = wezterm.action.ActivateTab(i - 1), -- tabs are 0 indexed
		})
	end
	for _, binding in ipairs(keymap_definitions) do
		table.insert(config.keys, binding)
	end
end

return M
