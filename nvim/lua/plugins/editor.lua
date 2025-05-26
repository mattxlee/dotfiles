return {
    {
        "ntpeters/vim-better-whitespace",
        config = function()
            vim.keymap.set("n", "<leader>x", ":StripWhitespace<CR>")
            vim.keymap.set("n", "]x", ":NextTrailingWhitespace<CR>")
            vim.keymap.set("n", "[x", ":PrevTrailingWhitespace<CR>")
        end
    },
    { "kylechui/nvim-surround", config = true },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = "▏",
            },
            scope = { enabled = false },
        }
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "folke/todo-comments.nvim", config = function()
            vim.keymap.set({ "n", "v" }, "<leader>to", function ()
                require("fzf-lua").grep({search="TODO|HACK|PERF|NOTE|FIX", no_esc=true})
            end)

            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next todo comment" })

            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })
        end
    },
    {
        "stevearc/conform.nvim",
        opts = {},
        config = function()
            vim.keymap.set("n", "<Leader>i", function()
                require("conform").format()
            end)
        end
    },
}