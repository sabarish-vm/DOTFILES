local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.exec_right_pane(window, pane, script)
	window:perform_action(
		act.SplitPane({
			direction = "Right",
			command = {
				args = {
					"zsh",
					"-c",
					script,
				},
			},
			size = { Percent = 25 },
		}),
		pane
	)
end

return M
