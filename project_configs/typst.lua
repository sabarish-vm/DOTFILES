local project_root = vim.fs.abspath(LazyVim.root.get())
local fonts_path = vim.fs.joinpath(project_root, "fonts")
return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tinymist = {
					root_dir = function(_, on_dir)
						on_dir(project_root)
					end,
					settings = {
						rootPath = project_root,
						fontPaths = { fonts_path },
					},
				},
			},
		},
	},
}
