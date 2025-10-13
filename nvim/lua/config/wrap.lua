vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.breakat = ""
        vim.cmd(":Wrapwidth 80")
    end,
})
