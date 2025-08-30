require("conform").setup({
    formatters_by_ft = {
        -- bash = { "beautysh" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        glsl = { "clang-format" },
        lua = { "stylua" },
        python = { "black" },
        -- tex = { "latexindent" },
    },
    format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
    },
})
