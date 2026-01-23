vim.api.nvim_create_autocmd("FileType", {
	pattern = "templ",
	callback = function()
		require("Comment.ft").set("templ", "// %s")
	end,
})
