local capabilites = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("clangd", {
	capabilites = capabilites,
	cmd = {
		"clangd",
		"--query-driver=/usr/bin/gcc",
		"--query-driver=/usr/bin/g++",
	},
	filetypes = { "c", "h", "cpp" },
})
vim.lsp.enable("clangd")
