vim.keymap.set("n", "<C-j>", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "<Leader>.", ":Oil<CR>")

local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- use all default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- remove a default
    vim.keymap.del("n", "<C-e>", { buffer = bufnr })
end

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 44,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 500,
    },
    ---
    reload_on_bufenter = true,
    on_attach = my_on_attach,
    ---
})

vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
        local invalid_win = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
                table.insert(invalid_win, w)
            end
        end
        if #invalid_win == #wins - 1 then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
        end
    end
})
