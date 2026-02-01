local wezterm = require("wezterm")

M = {}

M.config_dir = wezterm.config_dir
M.home = os.getenv("HOME")

return M
