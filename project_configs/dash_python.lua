return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tailwindcss = {
					filetypes = { "python" },
					settings = {
						tailwindCSS = {
							validate = true,
							classAttributes = {
								"className",
							},
							includeLanguages = {
								python = "html",
							},
						},
					},
				},
			},
		},
	},
}
