vim.keymap.set("i", "<C-y>", function()
    require("copilot.suggestion").accept()
end, { silent = true, noremap = true })
vim.keymap.set("i", "<C-e>", function()
    require("copilot.suggestion").accept_line()
end, { silent = true, noremap = true })
vim.keymap.set("i", "<C-k>", function()
    require("copilot.suggestion").dismiss()
end, { silent = true, noremap = true })

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        require("copilot.suggestion").dismiss()
    end,
})
