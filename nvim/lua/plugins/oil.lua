return {
    {
        'stevearc/oil.nvim',
        opts = {
            columns = {},
            keymaps = {
                ["<C-p>"] = false,
            },
        },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    }
}
