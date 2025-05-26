return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown" },
            sync_install = false,
            ignore_install = {},
            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = false },
        }
    },
}