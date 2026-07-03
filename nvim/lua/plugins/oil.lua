return {
    {
        'stevearc/oil.nvim',
        opts = {
            columns = {},
            keymaps = {
                ["<C-s>"] = false,
                ["<C-h>"] = false,
                ["<C-p>"] = false,
            },
        },
        view_options = {
            show_hidden = true,
        },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    }
}
