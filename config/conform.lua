require("conform").setup({
	formatters_by_ft = {
		bash = { "beautysh" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		glsl = { "clang-format" },
		java = { "clang-format" },
		lua = { "stylua" },
		make = { "bake" },
		python = { "black" },
		sh = { "beautysh" },
		typst = { "typstyle" },
	},
	formatters = {
		typstyle = {
			append_args = { "-l", "80" },
		},
	},
	format_on_save = {
		timeout_ms = 10000,
		lsp_format = "fallback",
	},
})
