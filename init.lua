#!/usr/bin/env lua5.1

local function scandir(dir)
	local i, t, popen = 0, {}, io.popen
	local pfile = popen('ls -a "' .. dir .. '"')
	if pfile == nil then
		return nil
	end
	for filename in pfile:lines() do
		i = i + 1
		t[i] = filename
	end
	pfile:close()
	return t
end

package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/?.lua"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.c_gnu = true
vim.g.c_syntax_for_h = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.number = true
vim.o.winborder = "shadow"

vim.o.whichwrap = "<,>,[,]"
vim.o.fillchars = "stl:─"

vim.o.redrawtime = 10000

if vim.fn.has("termguicolors") then
	vim.opt.termguicolors = true
end

vim.keymap.set("n", "<Tab>", "<cmd> tabn <CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd> tabp <CR>")
vim.keymap.set("n", "<M-]>", "<C-w><C-]><C-w>T")
vim.keymap.set("n", "gF", "<C-w>gf<C-w>T")
vim.keymap.set("n", "==", "80a=<Esc>d80|")

vim.keymap.set("n", "<M-d>", function()
	vim.diagnostic.open_float()
end)

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})

local links = {
	-- Colorschemes
	"https://github.com/rockerBOO/boo-colorscheme-nvim",
	"https://github.com/mellow-theme/mellow.nvim",
	"https://github.com/nyoom-engineering/oxocarbon.nvim",
	"https://github.com/rose-pine/neovim",

	-- Completion
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/saghen/blink.cmp",

	-- LSP
	"https://github.com/neovim/nvim-lspconfig",

	-- UI
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/lambdalisue/vim-nerdfont",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/xiyaowong/transparent.nvim",
	"https://github.com/lukas-reineke/indent-blankline.nvim",

	-- Files
	"https://github.com/stevearc/oil.nvim",

	-- Editing
	"https://github.com/numToStr/Comment.nvim",
	"https://github.com/stevearc/conform.nvim",

	-- Miscellaneous
	"https://github.com/catgoose/nvim-colorizer.lua",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/sitiom/nvim-numbertoggle",
	"https://github.com/vyfor/cord.nvim",
	"https://github.com/karb94/neoscroll.nvim",
}

vim.pack.add(links)

local dirs = scandir(os.getenv("HOME") .. "/.local/share/nvim/site/pack/core/opt/")
if dirs == nil then
	dirs = {}
end

for _, dir in ipairs(dirs) do
	if dir == "." or dir == ".." then
		goto next_dir
	end

	for _, link in ipairs(links) do
		if string.sub(link:match("/[^/]*$"), 2) == dir then
			goto next_dir
		end
	end
	vim.pack.del({ dir })

	::next_dir::
end

local colorscheme = "rose-pine-moon"
vim.cmd.colorscheme(colorscheme)

if colorscheme == "rose-pine-moon" then
	vim.api.nvim_set_hl(0, "Include", { fg = "#3E8FB0", italic = true })
end

require("config.blink")

vim.lsp.enable("basedpyright")
vim.lsp.enable("bashls")
require("config.lsp.clangd")
require("config.lsp.hyprls")
require("config.lsp.lua_ls")
require("config.lsp.tinymist")
require("config.lsp.unocss")

require("config.lualine")
require("config.transparent")
require("ibl").setup()

require("config.oil")

require("Comment").setup()
require("config.conform")

require("nvim-autopairs").setup()
require("config.cord")
require("config.neoscroll")
