local capabilites = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("tinymist", {
	capabilites = capabilites,
})
vim.lsp.enable("tinymist")
