return {
    {
        "zbirenbaum/copilot.lua",
        opts = {
            panel = {
                enabled = false,
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                hide_during_completion = true,
                debounce = 600,
                trigger_on_accept = true,
                keymap = {
                    accept = '<C-h>',
                    accept_word = '<C-f>',
                    accept_line = '<C-j>',
                    next = '<C-n>',
                    prev = '<C-p>',
                    dismiss = "<C-]>",
                },
            },
        }
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        opts = {
            window = {
                layout = "replace",
            },
            mappings = {
                submit_prompt = {
                    normal = '<CR>',
                    insert = '<C-j>'
                },
                show_diff = {
                    full_diff = true
                }
            }
        },
    },
}
