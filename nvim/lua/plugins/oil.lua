return {
    {
        "JezerM/oil-lsp-diagnostics.nvim",
        dependencies = { "stevearc/oil.nvim" },
        opts = {}
    },
    { "malewicz1337/oil-git.nvim", dependencies = { "stevearc/oil.nvim" } },
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
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
