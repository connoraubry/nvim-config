require("config")

vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "E501" },
					maxLineLength = 120,
				},
			},
		},
	},
})

