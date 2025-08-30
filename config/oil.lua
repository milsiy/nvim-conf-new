require("oil").setup({
    default_file_explorer = true,
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
    use_default_keymaps = true,
    view_options = { show_hidden = true },
})

vim.keymap.set("n", "<M-o>", function() require("oil").open() end)
