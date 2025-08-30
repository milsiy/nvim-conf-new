#!/usr/bin/lua5.1

package.path = package.path .. ";/home/milkymilsy/.config/nvim/?.lua"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.c_gnu = true
vim.g.c_syntax_for_h = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.number = true

vim.o.signcolumn = "no"

vim.o.whichwrap = "<,>,[,]"
vim.o.fillchars = "stl:─"

vim.o.redrawtime = 10000

if vim.fn.has("termguicolors") then vim.opt.termguicolors = true end

vim.keymap.set("n", "<Tab>", "<cmd> tabn <CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd> tabp <CR>")
vim.keymap.set("n", "<M-]>", "<C-w><C-]><C-w>T")
vim.keymap.set("n", "gF", "<C-w>gf<C-w>T")

vim.keymap.set("n", "<M-d>", function() vim.diagnostic.open_float() end)

vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
})

vim.pack.add({
    -- Colorschemes
    "https://github.com/djjcast/mirodark",

    -- LSP
    "https://github.com/neovim/nvim-lspconfig",

    -- UI
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/lambdalisue/vim-nerdfont",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/xiyaowong/transparent.nvim",

    -- Files
    "https://github.com/stevearc/oil.nvim",

    -- Editing
    "https://github.com/numToStr/Comment.nvim",
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/ms-jpq/coq_nvim",

    -- Miscellaneous
    "https://github.com/sphamba/smear-cursor.nvim",
    "https://github.com/catgoose/nvim-colorizer.lua",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/sitiom/nvim-numbertoggle",
    "https://github.com/vyfor/cord.nvim",
})

local curr_scheme = "mirodark"

vim.cmd.colorscheme(curr_scheme)
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NvimDarkGrey1" })

require("config.lsp.lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("basedpyright")

require("config.lualine")
require("config.transparent")

require("config.oil")

require("Comment").setup()
require("config.conform")

require("smear_cursor").setup()
require("nvim-autopairs").setup()

vim.cmd("COQnow")
