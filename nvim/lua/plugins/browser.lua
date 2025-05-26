return {
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        opts = {
            columns = {
                "icon",
                -- "permissions",
                "size",
                -- "mtime",
            },
            use_default_keymaps = false,
            keymaps = {
                ["q"] = "actions.close",
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-l>"] = "actions.refresh",
                ["<C-v>"] = "actions.preview",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = { "actions.cd", opts = { scope = "tab" } },
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
            },
            view_options = {
                show_hidden = true,
            },
        },
        init = function()
            vim.keymap.set("n", "<C-j>", ":Oil<CR>")
        end,
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            winopts = {
                height = 0.9,
                width = 0.9,
                backdrop = 100,
            },
            keymap = {
                fzf = {
                    ["ctrl-q"] = "select-all+accept",
                },
            },
            fzf_colors = {
                true,   -- inherit fzf colors that aren"t specified below from
                -- the auto-generated theme similar to `fzf_colors=true`
                ["fg"]          = { "fg", "CursorLine" },
                ["bg"]          = { "bg", "Normal" },
                ["hl"]          = { "fg", "Comment" },
                ["fg+"]         = { "fg", "Normal" },
                ["bg+"]         = { "bg", { "CursorLine", "Normal" } },
                ["hl+"]         = { "fg", "Statement" },
                ["info"]        = { "fg", "PreProc" },
                ["prompt"]      = { "fg", "Conditional" },
                ["pointer"]     = { "fg", "Exception" },
                ["marker"]      = { "fg", "Keyword" },
                ["spinner"]     = { "fg", "Label" },
                ["header"]      = { "fg", "Comment" },
                ["gutter"]      = "-1",
            },
        },
        config = function()
            require("fzf-lua").register_ui_select()
            vim.keymap.set("n", "<c-p>", ":FzfLua files<CR>")
            vim.keymap.set("n", "<leader>l", ":FzfLua grep_cword<CR>")
            vim.keymap.set("n", "<leader>f", ":FzfLua live_grep<CR>")
            vim.keymap.set("n", "<leader>z", ":FzfLua diagnostics_workspace<CR>")
            vim.keymap.set("n", "<leader>o", ":FzfLua lsp_document_symbols<CR>")
            vim.keymap.set("n", "<leader>g", ":FzfLua lsp_live_workspace_symbols<CR>")
            vim.keymap.set("n", "<leader>b", ":FzfLua buffers<CR>")
            vim.keymap.set("n", "gr", ":FzfLua lsp_references<CR>")
        end,
    },
}