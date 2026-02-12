require("blink.cmp").setup({
	keymap = { preset = "enter" },
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},
	signature = { enabled = true },
})

vim.cmd.cd("~/.local/share/nvim/site/pack/core/opt/blink.cmp/")
vim.cmd("!cargo +nightly build --release")
vim.cmd.cd("-")
