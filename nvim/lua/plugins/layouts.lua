return {
    {
        "linrongbin16/lsp-progress.nvim",
        config = function()
            require("lsp-progress").setup()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                icons_enabled = true,
                component_separators = '',
                section_separators = '',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype', function()
                    return require('lsp-progress').progress()
                end },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        },
    }
}