return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = {
            open_mapping = [[<Leader>tt]],     -- Shortcut to open/close terminal
            insert_mappings = false,           -- Apply mapping in insert mode
            terminal_mappings = true,          -- Apply mapping in terminal mode
            direction = "float",
            float_opts = {
                border = "rounded",
            },
            size = function(term)
                if term.direction == "horizontal" then
                    return vim.o.lines * 0.5
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.5
                end
            end,
        }
    },
}
