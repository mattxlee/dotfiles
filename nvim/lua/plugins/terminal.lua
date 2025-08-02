return {
    {
        { 'akinsho/toggleterm.nvim', version = "*",
            config = {
                open_mapping = [[<C-\>]], -- Shortcut to open/close terminal
                insert_mappings = true,   -- Apply mapping in insert mode
                terminal_mappings = true, -- Apply mapping in terminal mode
                direction = "float",
            }
        }
    },
}