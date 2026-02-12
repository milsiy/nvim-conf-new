local capabilites = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("hyprls", {
	capabilites = capabilites,
})
vim.lsp.enable("hyprls")
