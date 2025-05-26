return {
    {
        "olimorris/codecompanion.nvim",
        opts = {
            strategies = {
                chat = {
                    adapter = "copilot",
                },
                inline = {
                    adapter = "copilot",
                },
                cmd = {
                    adapter = "copilot",
                }
            },
            display = {
                chat = {
                    window = {
                        position = "right",
                    },
                },
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "zbirenbaum/copilot.lua",
        },
    },
    {
        "zbirenbaum/copilot.lua",
        config = true,
    }
}