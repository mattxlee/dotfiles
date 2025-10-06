return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    hide_during_completion = true,
                    debounce = 75,
                    trigger_on_accept = true,
                    keymap = {
                        accept = "<C-y>",
                        accept_word = false,
                        accept_line = false,
                        next = false,
                        prev = false,
                        dismiss = "<C-k>",
                    },
                },
                filetypes = {
                    ["*"] = true,
                    help = false,
                },
                panel = { enabled = true },
            })
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            model = "gpt-4.1",    -- AI model to use
            temperature = 0.1,    -- Lower = focused, higher = creative
            window = {
                layout = "float", -- 'vertical', 'horizontal', 'float'
                width = 0.9,
                height = 0.9,
                border = "rounded",
            },
            auto_insert_mode = false,
        },
    },
}
