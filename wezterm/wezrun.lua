local wezterm = require("wezterm")

wezterm.on("user-var-changed", function(window, pane, _, value)
	local tab_infos = window:mux_window():tabs_with_info()
	for _, obj in ipairs(tab_infos) do
		if obj.is_active then
			local target_index = obj.index
			window:perform_action(wezterm.action.SpawnCommandInNewTab({ args = { "bash", "-c", value } }), pane)
			window:perform_action(wezterm.action.MoveTab(target_index), pane)
			break
		end
	end
end)
