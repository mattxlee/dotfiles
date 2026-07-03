return {
    {
        "folke/todo-comments.nvim",
        config = function()
            vim.keymap.set({ "n", "v" }, "<Leader>to", function()
                require("fzf-lua").grep({ search = "TODO|NOTE", no_esc = true })
            end)

            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next todo comment" })

            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })
        end
    }
}
