return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        lazy = false,
        opts = {
            close_if_last_window = true,
            filesystem = {
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
                window = {
                    position = "left",
                    width = 53,
                    mappings = {
                        ["]c"] = "next_git_modified",
                        ["[c"] = "prev_git_modified",
                    },
                },
            },
        },
    },
    {
        'stevearc/oil.nvim',
        opts = {
            columns = {},
            keymaps = {
                ["<C-v>"] = "actions.preview",
                ["<C-p>"] = false,
            },
        },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },
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
                        -- the auto-generated theme similar to `fzf_colors=true`
                        ["fg"]      = { "fg", "CursorLine" },
                        ["bg"]      = { "bg", "Normal" },
                        ["hl"]      = { "fg", "Comment" },
                        ["fg+"]     = { "fg", "Normal" },
                        ["bg+"]     = { "bg", { "CursorLine", "Normal" } },
                        ["hl+"]     = { "fg", "Statement" },
                        ["info"]    = { "fg", "PreProc" },
                        ["prompt"]  = { "fg", "Conditional" },
                        ["pointer"] = { "fg", "Exception" },
                        ["marker"]  = { "fg", "Keyword" },
                        ["spinner"] = { "fg", "Label" },
                        ["header"]  = { "fg", "Comment" },
                        ["gutter"]  = "-1",
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
            vim.keymap.set("n", "gr", ":FzfLua lsp_references<CR>")
        end,
    },
}