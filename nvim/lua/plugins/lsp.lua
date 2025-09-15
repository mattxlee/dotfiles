return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        }
    },
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },
    { "hrsh7th/nvim-cmp",    dependencies = { "zbirenbaum/copilot-cmp" } },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    {
        "petertriho/cmp-git",
        dependencies = { 'hrsh7th/nvim-cmp' },
        init = function()
            table.insert(require("cmp").get_config().sources, { name = "git" })
        end
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },
}
