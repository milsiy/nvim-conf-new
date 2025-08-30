local coq = require("coq")

vim.lsp.config("clangd", coq.lsp_ensure_capabilities())
vim.lsp.enable("clangd")
