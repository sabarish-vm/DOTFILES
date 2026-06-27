local wezterm = require("wezterm")
local M = {}

function M.add_status_bar()
	wezterm.on("update-status", function(window, _)
		local name = window:active_key_table()
		if name then
			name = " MODE: " .. name .. " "
		else
			name = ""
		end

		window:set_right_status(wezterm.format({
			{ Background = { Color = "#7aa2f7" } }, -- Blue background (adjust to your theme)
			{ Foreground = { Color = "#1d202f" } }, -- Dark text
			{ Text = name },
		}))
	end)
end

return M
