require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"markdown",
		"markdown_inline",
		"printf",
		"python",
		"vim",
		"vimdoc",
		"query",
	},

	sync_install = true,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
})
