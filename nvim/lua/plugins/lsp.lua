return {
    { "nvim-treesitter/nvim-treesitter",    branch = "main", lazy = false, build = ":TSUpdate" },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        }
    },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    {
        "petertriho/cmp-git",
        dependencies = { 'hrsh7th/nvim-cmp', 'nvim-lua/plenary.nvim' },
        init = function()
            table.insert(require("cmp").get_config().sources, { name = "git" })
        end
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },
    {
        "nvim-flutter/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = true,
    },
}
