return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        opts = {
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = false,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "",  -- can be 'hard', 'soft' or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false,
        },
        config = function()
            vim.cmd [[
                set background=dark
                colorscheme gruvbox
                highlight SignColumn guibg=0
                hi! link CurSearch Cursor
                hi! link IncSearch PmenuThumb
                hi! link Search PmenuThumb
            ]]
        end
    },
    {
        "erl-koenig/theme-hub.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- Optional: for themes that use lush (will be notified if a theme requires it)
            -- "rktjmp/lush.nvim"
        },
        config = function()
            require("theme-hub").setup({
                persistent = true,
            })
        end,
    }
}

