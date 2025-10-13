return {
    {
        "nvim-pack/nvim-spectre",
        dependencies = { "nvim-lua/plenary.nvim" },
        init = function()
            require("spectre").setup({
                open_cmd = "new",
            })
            vim.keymap.set("n", "<Leader>h", '<cmd>lua require("spectre").toggle()<CR>', {
                desc = "Toggle Spectre"
            })
        end,
    }
}
