return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = false,
                    auto_trigger = false,
                    hide_during_completion = true,
                    debounce = 75,
                    trigger_on_accept = true,
                    keymap = {
                        accept = false,
                        accept_word = false,
                        accept_line = false,
                        next = false,
                        prev = false,
                        dismiss = false,
                    },
                },
                filetypes = {
                    ["*"] = true,
                    help = false,
                },
                panel = { enabled = false },
            })
        end,
    },
}
