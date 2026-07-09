return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("fzf-lua").setup(
                {
                    winopts = {
                        height = 0.9,
                        width = 0.9,
                        backdrop = 100,
                        preview = {
                            hidden = false,
                            layout = "vertical",
                            vertical = "down:50%",
                        },
                    },
                    keymap = {
                        fzf = {
                            ["ctrl-q"] = "select-all+accept",
                        },
                    },
                    fzf_colors = {
                        true, -- inherit fzf colors that aren"t specified below from
                    },
                }
            )
            require("fzf-lua").register_ui_select()
            vim.keymap.set("n", "<c-p>", ":FzfLua files<CR>")
            vim.keymap.set("n", "<Leader>l", ":FzfLua grep_cword<CR>")
            vim.keymap.set("n", "<Leader>f", ":FzfLua live_grep<CR>")
            vim.keymap.set("n", "<Leader>z", ":FzfLua diagnostics_workspace<CR>")
            vim.keymap.set("n", "<Leader>o", ":FzfLua lsp_document_symbols<CR>")
            vim.keymap.set("n", "<Leader>g", ":FzfLua lsp_live_workspace_symbols<CR>")
            vim.keymap.set("n", "<Leader>b", ":FzfLua buffers<CR>")
            vim.keymap.set("n", "gd", ":FzfLua lsp_definitions<CR>")
            vim.keymap.set("n", "gr", ":FzfLua lsp_references<CR>")
            vim.keymap.set("n", "gi", ":FzfLua lsp_implementations<CR>")
        end,
    }
}
