vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(opts)
		if opts.data.spec.name == "cord.nvim" and opts.data.kind == "update" then
			vim.cmd("Cord update")
		end
	end,
})

require("cord").setup({})
